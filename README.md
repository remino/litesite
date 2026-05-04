# LiteSite

Boilerplate and command wrapper for tiny sites that do not need a framework.

By Rémino Rem <https://remino.net>, 2026

## Layout

- Source lives in `src/`
- Publishable output goes in `dist/`
- Public files in `src/public/` are copied to `dist/public/`
- A LiteSite site root is expected to contain `src/`, `.deploy-filter`,
  `justfile`, and `.editorconfig`

## Commands

- `litesite` shows the usage screen by default
- `litesite -C /path/to/site build` runs a command against another site root
- `litesite build` builds `dist/`, minifies HTML/CSS/JS, copies public files,
  generates AVIF JPG and WebP derivatives, and writes Brotli and gzip variants
- `litesite serve` runs `live-server` on `src/public/`
- `litesite deploy` builds and deploys `dist/` with
  [`rsdeploy`](https://github.com/remino/remutils/tree/main/rsdeploy)
- `litesite deploy -n` builds and previews the deploy without writing changes
- `litesite compress` regenerates `.br` and `.gz` files for an existing `dist/`
- `litesite jpg path/to/file.avif` converts AVIF files to JPG beside the source
  path
- `litesite webp path/to/file.avif` converts AVIF files to WebP beside the
  source path

## Media Workflow

If you drop `*.avif` files anywhere under `src/`, the build will:

- copy the AVIF into `dist/`
- generate a sibling `*.jpg`
- generate a sibling `*.webp`

This also works for files under `src/public/`, which publish to `dist/public/`.

## Deployment

`bin/deploy` uses `.deploy-filter` for the rsync filter.

The site `.env` can disable build-time extras:

- `LITESITE_BUILD_BROTLI=0` skips Brotli output
- `LITESITE_BUILD_GZIP=0` skips gzip output
- `LITESITE_BUILD_AVIF_JPEG=0` skips JPG derivative generation
- `LITESITE_BUILD_AVIF_WEBP=0` skips WebP derivative generation

`rsdeploy` is required only for `litesite deploy`.

## New Site

To scaffold a new site from this template, run:

```bash
./litesite new newsite
```

By default that creates `./newsite` in the current directory. Pass a second
argument to choose a different destination directory. `init` remains available
as an alias.

The generated site includes `README.md`, `.gitignore`, `.env`, `justfile`, and
a fresh git repository.

## Licence

ISC. See [LICENSE](./LICENSE.txt) for details.
