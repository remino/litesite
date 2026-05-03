set shell := ["bash", "-eu", "-o", "pipefail", "-c"]
root_dir := env_var_or_default("ROOT_DIR", justfile_directory())

default: serve

build:
    ./bin/build '{{root_dir}}'

clean:
    rm -rf dist

serve:
    ./bin/serve '{{root_dir}}'

deploy: build
    ./bin/rsdeploy '{{root_dir}}'

compress:
    ./bin/build-brotli '{{root_dir}}/dist'
    ./bin/build-gzip '{{root_dir}}/dist'

media:
    ./bin/build-media '{{root_dir}}/dist'

jpg *files:
    for file in {{files}}; do ./bin/avif-to-jpg "$file"; done

webm *files:
    for file in {{files}}; do ./bin/avif-to-webm "$file"; done
