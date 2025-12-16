#!/bin/bash

dependencies=(
    zola
    git
)

for dependency in "${dependencies[@]}"; do
    if ! which "$dependency" >/dev/null 2>&1; then
        echo "${dependency} not found" && exit 1
    fi
done

GRAPHICS_PROJECT_DIR="/builds/printfdebugging/website/learnopengl"
WEBSITE_DIR="/builds/printfdebugging/website"
GRAPHICS_PROJECT_UPSTREAM="https://gitlab.com/printfdebugging/learnopengl.git"

git clone --depth 1 \
    "$GRAPHICS_PROJECT_UPSTREAM" \
    "$GRAPHICS_PROJECT_DIR"

(
    cd "$GRAPHICS_PROJECT_DIR"
    git submodule init
    git submodule update --recursive
)

for tutorialDir in $(find "${GRAPHICS_PROJECT_DIR}/source/tutorials/" -mindepth 1 -maxdepth 1 -type d); do
    # step 1: check if the tutorials have a readme
    [ -f "${tutorialDir}/README.md" ] || {
        echo "${tutorialDir}/README.md not found" && exit 1
    }

    # step 2: check if the readme has the include directive
    grep -qe "{{ include(path=\"/canvas.md\") }}" "${tutorialDir}/README.md" || {
        echo "${tutorialDir}/README.md doesn't have include /canvas.md directive" && exit 1
    }

    # step 3: copy the file to content/graphics
    dirName="$(basename "$tutorialDir")"
    mkdir -p "${WEBSITE_DIR}/content/graphics/${dirName}"
    cp "${tutorialDir}/README.md" "${WEBSITE_DIR}/content/graphics/${dirName}/index.md"
done

# build the blog
zola build
