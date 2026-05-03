# LiteSite

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

`bin/deploy` uses `.rsdeploy-exclude` for the rsync filter.

## New Site

To copy this boilerplate into a new site and rename the `mysite` paths and
references, run:

```bash
just init newsite
```

or:

```bash
./bin/init newsite
```

By default that creates `../newsite` from the current repository. Pass a second
argument to choose a different destination directory.
