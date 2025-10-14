# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal blog/portfolio site built with Astro v4 and deployed to Vercel. The site uses TypeScript and is managed with Yarn package manager. It features a blog section with current posts and an archive section for older content.

## Development Commands

All commands run from the project root:

- `yarn dev` or `yarn start` - Start local dev server at `localhost:4321`
- `yarn build` - Build production site (runs `astro check` then `astro build`)
- `yarn preview` - Preview production build locally
- `yarn astro` - Run Astro CLI commands

## Architecture

### Content Collections

The site uses Astro's content collections system defined in `src/content/config.ts`:

- **blog** collection: Current blog posts in `src/content/blog/`
- **archive** collection: Older posts in `src/content/archive/`

Both collections share the same schema with frontmatter fields: `title`, `description`, `pubDate`, `updatedDate`, `heroImage`, and `keywords`.

### Routing Structure

- `/` - Homepage (`src/pages/index.astro`)
- `/blog/` - Blog listing page (`src/pages/blog/index.astro`)
- `/blog/[...slug]/` - Individual blog posts (`src/pages/blog/[...slug].astro`)
- `/archive/` - Archive listing page (`src/pages/archive/index.astro`)
- `/archive/[...slug]/` - Individual archive posts (`src/pages/archive/[...slug].astro`)
- Multiple static markdown pages: `/about.md`, `/cv.md`, `/now.md`, `/ideas.md`, `/impressum.md`, `/forkme.md`

### RSS Feeds

The site provides RSS feeds at multiple endpoints for backwards compatibility:
- `src/pages/feed.ts`
- `src/pages/feed.rss.ts`
- `src/pages/rss.xml.ts`

### Deployment Configuration

- **Platform**: Vercel serverless (`output: "server"`)
- **Adapter**: `@astrojs/vercel` with web analytics enabled
- **Domain**: `https://www.stratha.us`
- **Integrations**: Sitemap generation via `@astrojs/sitemap`

### URL Redirects

The `astro.config.mjs` contains extensive redirect mappings from old URLs to current `/archive/` routes. When modifying archive content, maintain these redirects for backwards compatibility.

### Site Constants

Global site metadata is defined in `src/consts.ts`:
- `SITE_TITLE`: "johann philipp strathausen"
- `SITE_DESCRIPTION`: "berlin based senior full stack developer"

### Component Architecture

- **Layout**: `src/layouts/BlogPost.astro` - Template for blog posts
- **Components**:
  - `BaseHead.astro` - Meta tags and SEO
  - `Header.astro` - Site navigation
  - `Footer.astro` - Site footer
  - `HeaderLink.astro` - Navigation links
  - `FormattedDate.astro` - Date formatting component

Both blog and archive index pages use nearly identical structures, fetching their respective collections and sorting by `pubDate` (newest first).
