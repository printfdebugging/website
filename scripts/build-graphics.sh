#!/bin/bash

dependencies=(
    emcmake
    cmake
    make
    git
)

for dependency in "${dependencies[@]}"; do
    if ! which "$dependency" >/dev/null 2>&1; then
        echo "${dependency} not found" && exit 1
    fi
done

GRAPHICS_PROJECT_DIR="/builds/printfdebugging/website/learnopengl"
WEBSITE_PUBLIC_DIR="/builds/printfdebugging/website/public"
# GRAPHICS_PROJECT_UPSTREAM="https://gitlab.com/printfdebugging/learnopengl.git"

# NOTE: this is already done in ./generate-graphics.sh
# git clone --depth 1 \
#     "$GRAPHICS_PROJECT_UPSTREAM" \
#     "$GRAPHICS_PROJECT_DIR"

emcmake cmake \
    -DUSE_GENERATED_INDEX_HTML=TRUE \
    -DGENERATED_GRAPHICS_DIR_PATH="${WEBSITE_PUBLIC_DIR}" \
    -S "${GRAPHICS_PROJECT_DIR}" -B "${GRAPHICS_PROJECT_DIR}/build"

cmake --build "${GRAPHICS_PROJECT_DIR}/build"
cmake --install "${GRAPHICS_PROJECT_DIR}/build" --prefix "${GRAPHICS_PROJECT_DIR}/install"

# move installed artifacts to blog directory
cp -r ${GRAPHICS_PROJECT_DIR}/install/bin/* "${WEBSITE_PUBLIC_DIR}/graphics"
