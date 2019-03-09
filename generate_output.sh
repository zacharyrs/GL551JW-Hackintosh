#!/usr/bin/env bash

echo "Generating output..."
echo ""
echo ""

if [ ! -d ./output ]; then mkdir ./output; fi && rm -Rf ./output/*

./compile_patches.sh
./patch_plists.sh
./download_kexts.sh

echo "Done!"
