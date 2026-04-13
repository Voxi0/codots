# Deployment

The documentation is built into the `site/` directory.

## Build

To build the site manually:

```bash
node build-docs.js
```

This outputs static HTML to `site/`.

## Cloudflare Pages

1. Push changes to GitHub.
2. Log in to Cloudflare Dashboard > Pages.
3. Create a new project > Connect to Git.
4. Select `constructor2828-web/codots`.
5. Configure:
   - **Build command**: `node build-docs.js`
   - **Build output directory**: `site`
6. Click **Save and Deploy**.

The site will be available at `codots.pages.dev` (or a custom domain if configured).

## Development

To serve the site locally:

```bash
cd site
python3 -m http.server 8000
```

Or using a static file server.