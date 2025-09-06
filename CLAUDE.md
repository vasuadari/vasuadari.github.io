# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a static personal website and blog hosted on GitHub Pages at vasuadari.in. The site uses vanilla HTML, CSS, and JavaScript without any build tools or frameworks.

## Architecture

- **index.html**: Main homepage with blog list
- **about-me.html**: About page 
- **blog posts**: Individual HTML files for each blog post (e.g., `the-gravity-of-vim-how-i-escaped-the-mouse.html`)
- **style.css**: Main stylesheet with dark/light theme support
- **script.js**: Theme detection and application based on system preferences
- **blog.js**: Reading time calculation utility for blog posts
- **docs/**: Contains PDF resume
- **images/**: Static assets

## Development

Since this is a static site with no build process:

- Open HTML files directly in browser for testing
- No package manager, build commands, or deployment steps required
- Changes are deployed automatically via GitHub Pages when pushed to master branch
- Custom domain configured via CNAME file (vasuadari.in)

## Adding New Blog Posts

1. Create new HTML file following existing blog post structure
2. Update the blog list in index.html to include the new post
3. Use `blog.js` calculateReadingTime() function for reading time estimates

## Theme System

The site automatically detects and applies dark/light themes based on user's system preferences using `script.js`.