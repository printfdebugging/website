#!/bin/bash

if [ -d "$HOME/repos/learnopengl" ]; then
    GRAPHICS_PROJECT_DIR="$HOME/repos/learnopengl"
else
    [ ! -d "learnopengl" ] && {
        git clone "https://gitlab.com/printfdebugging/learnopengl.git" --depth 1 || exit 1
    }
    GRAPHICS_PROJECT_DIR="learnopengl"
fi

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
    mkdir -p "content/graphics/${dirName}"
    cp "${tutorialDir}/README.md" "content/graphics/${dirName}/index.md"
done

# build the blog
zola build
