#!/bin/bash

if [ -d "$HOME/repos/learnopengl" ]; then
    GRAPHICS_PROJECT_DIR="$HOME/repos/learnopengl"
    WEBSITE_PUBLIC_DIR="$HOME/repos/website/public"
else
    [ ! -d "learnopengl" ] && git clone "https://gitlab.com/printfdebugging/learnopengl.git" --depth 1
    GRAPHICS_PROJECT_DIR="learnopengl"
    WEBSITE_PUBLIC_DIR="public"
fi

# build and install cmake project
(
    emcmake cmake \
        -DUSE_GENERATED_INDEX_HTML=TRUE \
        -DGENERATED_GRAPHICS_DIR_PATH="${WEBSITE_PUBLIC_DIR}" \
        -S "${GRAPHICS_PROJECT_DIR}" -B "${GRAPHICS_PROJECT_DIR}/build"

    cmake --build "${GRAPHICS_PROJECT_DIR}/build"
    cmake --install "${GRAPHICS_PROJECT_DIR}/build" --prefix "${GRAPHICS_PROJECT_DIR}/install"
)

# move installed artifacts to blog directory
cp -r ${GRAPHICS_PROJECT_DIR}/install/bin/* "${WEBSITE_PUBLIC_DIR}/graphics"
