defmodule SiteGenerator.MapExtension do
  def atomize_keys!(map) when is_map(map) do
    map
    |> Map.to_list()
    |> atomize_keys!()
    |> Map.new()
  end

  def atomize_keys!([]), do: []

  def atomize_keys!([{key, value} | list]) when is_binary(key) do
    [atomize_keys!({String.to_atom(key), value}) | atomize_keys!(list)]
  end

  def atomize_keys!([{key, value} | list]) do
    [atomize_keys!({key, value}) | atomize_keys!(list)]
  end

  def atomize_keys!({key, value}) when is_map(value) do
    {key, atomize_keys!(value)}
  end

  def atomize_keys!({key, value}), do: {key, value}
end
