set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

default: serve

build:
    ./bin/build

clean:
    rm -rf dist

serve:
    ./bin/serve

deploy: build
    ./bin/rsdeploy

compress:
    ./bin/build-brotli dist
    ./bin/build-gzip dist

media:
    ./bin/build-media

jpg *files:
    for file in {{files}}; do ./bin/avif-to-jpg "$file"; done

webm *files:
    for file in {{files}}; do ./bin/avif-to-webm "$file"; done
