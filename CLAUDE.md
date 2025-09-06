# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a static personal website and blog hosted on GitHub Pages at vasuadari.in. The site features a unique **terminal aesthetic** that simulates working in a command-line environment. Built with vanilla HTML, CSS, and JavaScript without any build tools or frameworks.

## Terminal Theme Architecture

The website is designed as a fullscreen terminal experience with three distinct interaction patterns:

### Page Types & Commands

- **Home Page (`index.html`)**: Simulates `ls -la` command showing directory structure
  - Displays directories (`about-me/`, `blogs/`) and files as Unix file listings
  - Navigation through clicking on directory/file entries
  - Current directory highlighted with Nord blue accent

- **About Page (`about-me.html`)**: Simulates `cat about-me.txt` command
  - Shows personal information as terminal text output
  - Clean text-based resume format with terminal colors
  - Experience, skills, and education sections with color-coded hierarchy

- **Blog Posts**: Simulates `vim filename.md` command
  - Vim editor interface with authentic status line
  - Markdown-style content rendering (`# title`, etc.)
  - Dracula color scheme for syntax highlighting within vim content

### Navigation System

**Terminal Directory Navigation** (not web-style menus):
- Home page shows filesystem structure via `ls -la` output
- Pages use `cd ..` command links to navigate back to root
- Directory permissions (`drwxr-xr-x`) and file attributes displayed
- No traditional nav bars - all navigation integrated into terminal simulation

### Visual Design

**Color Scheme**:
- **Background**: `#1e1e1e` (terminal black - permanent, no theme switching)
- **Text**: `#f8f8f2` (terminal white)
- **Accent**: `#88c0d0` (Nord blue for prompts, links, highlights)
- **Syntax Colors**: Dracula-inspired palette for blog content

**Typography**: Monospace fonts only (`Monaco`, `Consolas`, `Courier New`)

**Terminal Elements**:
- Prompts: `vasu@adari:~$`, `vasu@adari:~/blogs$`, etc.
- Blinking cursor animation
- File permissions, ownership, timestamps
- Vim status lines with filename and reading time

## File Structure

- **index.html**: Terminal with `ls -la` showing directory structure
- **about-me.html**: Terminal with `cat about-me.txt` output
- **blog posts**: Terminal with `vim filename.md` editor simulation
- **style.css**: Single terminal theme (no light/dark switching)
- **script.js**: Minimal - no theme detection (removed)
- **blog.js**: Reading time calculation for vim status line
- **docs/**: PDF resume
- **color-preview.html**: Development file (not part of main site)

## Development Guidelines

### Terminal Authenticity
- **Always maintain terminal illusion** - avoid web-like elements
- **Use appropriate Unix commands** for each page context
- **Keep monospace typography** throughout
- **No theme switching** - terminals are always black

### Content Standards
- **No trailing whitespace** - files must pass `git` whitespace checks
- **Proper indentation** with spaces (not tabs)
- **Clean terminal formatting** with authentic command structures

### Adding New Blog Posts

1. Create HTML file with vim editor structure:
   ```html
   <div class="terminal-session">
       <div class="terminal-line">
           <span class="terminal-prompt">vasu@adari:~/blogs$</span>
           <span class="terminal-command">vim new-post.md</span>
       </div>
       <div class="terminal-output blog-article">
           <!-- Vim interface with status line and content -->
       </div>
   </div>
   ```

2. Add file entry to index.html directory listing
3. Use vim-style content with Dracula syntax highlighting
4. Include reading time calculation in vim status line

## Technical Notes

- **Deployment**: Auto-deploy via GitHub Pages to vasuadari.in
- **No build process**: Direct HTML/CSS/JS files
- **Browser testing**: Open files directly
- **Version control**: Clean commits without whitespace errors
