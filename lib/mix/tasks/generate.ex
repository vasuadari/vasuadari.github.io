defmodule Mix.Tasks.SiteGenerator.Generate do
  use Mix.Task

  @source_dir "src"
  @build_dir "build"
  @layout_template_file "layout.html.eex"
  @settings_file "settings.json"

  alias SiteGenerator.MapExtension

  def run(_) do
    File.mkdir_p!(@build_dir)

    with {:ok, []} <- copy_dir(@source_dir, @build_dir) do
      covert_md_to_html_files()
    else
      {:error, error_message} ->
        IO.puts error_message
    end
  end

  defp copy_dir(source_path, destination_path) do
    with :ok <- File.mkdir_p(destination_path),
         {:ok, files} <- File.ls(source_path) do
      copy_files(files, source_path, destination_path)
    else
      _ ->
        {:ok, _} = File.rm_rf(destination_path)
        {:error, "Failed to copy directory"}
    end
  end

  defp copy_files([], _source_path, _destination_path), do: {:ok, []}

  defp copy_files([file | other_files], source_path, destination_path) do
    source_dir = Path.join([source_path, file])
    if File.dir?(source_dir) do
      destination_dir = Path.join([destination_path, file])
      with {:ok, _} <- copy_dir(source_dir, destination_dir) do
        copy_files(other_files, source_path, destination_path)
      end
    else
      with {:ok, _} <- File.copy(
        Path.join([source_path, file]),
        Path.join([destination_path, file])
      ) do
        copy_files(other_files, source_path, destination_path)
      end
    end
  end

  defp covert_md_to_html_files do
    settings = settings()

    File.ls()
    |> case do
      {:ok, files} ->
        Enum.each(files, fn
          file_name ->
            String.split(file_name, ".")
            |> case do
              [name, "md"] ->
                settings =
                  settings[name]
                  |> Map.to_list()
                  |> MapExtension.atomize_keys!()
                with {:ok, file} <- File.read(file_name),
                     {:ok, content, []} <- Earmark.as_html(file),
                     html_content <- EEx.eval_file(
                       @layout_template_file,
                       assigns: [content: content] ++ settings
                     ) do
                  Path.join([@build_dir, "#{name}.html"])
                  |> File.open([:read, :write], fn html_file ->
                    IO.binwrite(html_file, html_content)
                  end)
                end

              _ ->
                :skip
            end
        end)

      {:error, _} ->
        IO.puts "failed to list files"
    end
  end

  defp settings do
    @settings_file
    |> File.read!()
    |> Jason.decode!()
  end
end
