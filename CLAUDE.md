# CLAUDE.md

Guidance for Claude Code when working in this repository.

## Project Overview

Static personal site and blog hosted on GitHub Pages at vasuadari.in. Built with
plain HTML and CSS only — no frameworks, no build tools, no images for decoration.
A small amount of JavaScript exists only for Giscus comments (`script.js`) and
reading-time calculation (`blog.js`).

## Theme: "Engineer's Notebook"

A light, readable long-form theme with a nod to the site's terminal heritage.

- **Background artwork is pure CSS** — no image files. Three layers:
  `body` carries soft Nord-toned "aurora" radial glows; `body::before` is a
  fixed full-viewport layer composing a distributed-system topology (nodes,
  halos, diagonal links via corner-keyword gradients, orbit rings — one node
  is a play button, drawn with a conic-gradient wedge in a ring) top-right
  , PCB circuit traces with solder pads bottom-left, a vertical film strip
  (perforations and frame lines via repeating gradients) on the left edge, and
  a mid-solve Rubik's cube face (repeating-gradient grid + colored cells)
  bottom-right — the play button, film strip, and Rubik's face signal a love of
  movies and problem solving. Each piece is drawn as a
  positioned `no-repeat` gradient; `body::after` renders a faint vertical hex
  data-stream (ELF magic bytes) down the right edge. The artwork fades at
  ≤1180px, the hex stream hides at ≤900px, and `::before` hides at ≤600px so
  text always wins on small screens.
- **Palette** (Nord-derived, defined as CSS variables in `:root` of `style.css`):
  ink `#2e3440`, paper `#f5f7fa`, frost blue `#5e81ac` (links/accents),
  frost light `#88c0d0` (decorative), teal `#8fbcbb` (glows only).
- **Typography**: body in Charter/Georgia serif (`--font-serif`); all "machine"
  text — dates, nav, section labels, prompts, code — in `--font-mono`.
- **Signature elements**: the hero terminal prompt (`vasu@adari:~$ cat intro.txt`
  with blinking cursor), `~/` prefix on the logo, `## ` markdown-style prefixes
  on section headings, and `cd ..` on back-links. Keep these consistent.
- Code blocks (`pre`) render as dark Nord terminals on the light page.

## File Structure

- `index.html` — homepage: hero + list of post cards (newest first)
- `about-me.html` — resume-style about page
- `<slug>.html` — one file per blog post, flat in the repo root
- `_post-template.html` — copy this to create a new post (underscore keeps it
  out of search engines' way; do not link to it)
- `style.css` — single shared stylesheet; all pages inherit it
- `script.js` — Giscus comments (loads only on article pages)
- `sitemap.xml` — update when adding a post

## Adding a New Blog Post

1. Copy `_post-template.html` to `your-post-slug.html`.
2. Replace `POST_TITLE`, `POST_DESCRIPTION`, `POST_SLUG`, `POST_DATE`,
   `POST_TAGS` in the head, and fill in the article body.
3. Add a `.blog-card` entry at the top of the `.blog-posts` grid in
   `index.html` (title link, mono date, 1–2 sentence excerpt).
4. Add the URL to `sitemap.xml`.

Supported article elements (already styled in `.article-body`): h2–h4, p, a,
strong, em, ul/ol, blockquote, hr, img, figure/figcaption, table, code, pre,
kbd. Optional `.post-tags` pill list works on cards and under article headers.

## Constraints

- Plain HTML + CSS only. No frameworks, no CDN CSS, no decorative images.
- Accessibility floor: visible `:focus-visible` outlines and
  `prefers-reduced-motion` support are in `style.css` — preserve them.
- Mobile: `background-attachment` falls back to `scroll` under 768px.
