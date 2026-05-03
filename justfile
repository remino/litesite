set shell := ["bash", "-eu", "-o", "pipefail", "-c"]
src_dir := "src"
dist_dir := "dist"

default: serve

build:
    ./bin/build '{{src_dir}}' '{{dist_dir}}'

clean:
    rm -rf '{{dist_dir}}'

serve:
    ./bin/serve '{{src_dir}}'

deploy: build
    ./bin/deploy '{{dist_dir}}' -w

deploy-dryrun: build
    ./bin/deploy '{{dist_dir}}'

compress:
    ./bin/build-brotli '{{dist_dir}}'
    ./bin/build-gzip '{{dist_dir}}'

media:
    ./bin/build-media '{{dist_dir}}'

init slug:
    ./bin/init '{{slug}}'

jpg *files:
    for file in {{files}}; do ./bin/avif-to-jpg "$file"; done

webm *files:
    for file in {{files}}; do ./bin/avif-to-webm "$file"; done
