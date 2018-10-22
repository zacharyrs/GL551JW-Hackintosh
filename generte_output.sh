#!/usr/bin/env bash

if [ ! -d ./output ]; then mkdir ./output; fi && rm -Rf ./output/*

./compile_patches.sh
./patch_plists.sh
./download_kexts.sh
