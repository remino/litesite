# Litesite

Tiny-site boilerplate for pages that do not need a framework.

## Layout

- Source lives in `src/`
- Publishable output goes in `dist/`
- Public files in `src/public/` are copied to `dist/public/`

## Commands

- `just build` builds `dist/`, minifies HTML/CSS/JS, copies public files,
  generates AVIF derivatives, and writes Brotli and gzip variants
- `just serve` runs a local livereload server from `src/`
- `just deploy` builds and deploys `dist/` with `rsdeploy`
- `just compress` regenerates `.br` and `.gz` files for an existing `dist/`
- `just jpg path/to/file.avif` converts AVIF files to JPG beside the source path
- `just webm path/to/file.avif` converts AVIF files to WebM beside the source
  path

## Media Workflow

If you drop `*.avif` files anywhere under `src/`, the build will:

- copy the AVIF into `dist/`
- generate a sibling `*.jpg`
- generate a sibling `*.webm`

This also works for files under `src/public/`, which publish to `dist/public/`.

## Deployment

`bin/rsdeploy` reads the local `.env` file that already exists in the repo setup
and uses `.rsdeploy-exclude` for the rsync filter.

If you need a template for local setup, copy `.env.example` to `.env` and fill
in the destination.
