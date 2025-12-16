#!/bin/bash

# ## Custom Target
#
# - add it to the applicaiton's cmake while development and bind `cmake --build build -t run` in
#   you editor (if it's vim or emacs) to quickly run the application. do not commit this as that
#   doesn't make much sense.
#
# ## Hosting Wasm Binaries on Pages
#
# - Each binary has a index.md file
# - This index.md file will have some boilerplate html (for the canvas & javascript)
# - Journal (printfdebugging.in) will pull this repo & use zola to
#   convert these index.md files to index.html using a script. that index.html file will
#   be placed in install/bin/...
# - Then each of these tutorials will use the generated file as shell file to generate their
#   own html, wasm, js..
# - then we install all three files to install/bin/tutorial/.. & finally copy that over
#   to content/graphics/
# - this is dummy index.html used when building standalone wasm applications.
# - when building with zola with -DZOLA_CREATE_SHELL_FILES, zola journals ci will run
#   the build-graphics.sh script first which will then generate the shell
#   files in public/graphics/name. these should then use those files as the shell files.
# - TODO: look into what is a shell file

# STEP 1: build index.html shell files
#   - copy over the docs/readme.md files from tutorials/${name}
#   - put them in the content/graphics/${name}/index.md
#   - build the site

# STEP 2: build wasm binaries with generated files
#   - use public/graphics/${name}/index.html to build ${name} tutorial
#   - once all tutorials are built, install them to install directory
#   - copy install/bin/* to public/graphics/*
#   - deploy!!
