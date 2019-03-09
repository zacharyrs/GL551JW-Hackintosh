#!/usr/bin/env bash

function download_rm()
{
    echo "Downloading $2:"
    curl --location --silent --output /tmp/download.txt https://bitbucket.org/RehabMan/$1/downloads/
    scrape=`grep -o -m 1 "/RehabMan/$1/downloads/$2.*\.zip" /tmp/download.txt|perl -ne 'print $1 if /(.*)\"/'`
    url=https://bitbucket.org$scrape
    curl --remote-name --progress-bar --location "$url"
}

function compile_patch()
{
    echo "... $1"
    ./tools/iasl -p output/efi/amls/$1.aml patches/$1.dsl >> output/efi/amls/log.txt
}

if [ ! -d ./tools ]; then mkdir ./tools; fi

if [ ! -d ./output ]; then mkdir ./output; fi && cd ./output/
if [ ! -d ./efi ]; then mkdir ./efi; fi && cd ./efi/
if [ ! -d ./amls ]; then mkdir ./amls; fi && rm -Rf ./amls/*
cd ../../

if [ ! -f tools/iasl ]; then
    echo "iasl not downloaded, getting now!"
    cd tools
    download_rm acpica iasl
    unzip 'iasl.zip'
    rm 'iasl.zip'
    cd ..
fi


echo "Compiling patches"

# compile_patch SSDT-PS2K-WIP # reverted from AsusSMC - couldn't make it work...
compile_patch SSDT-HDEF # done via clover now add properties, but CodecCommander config here
compile_patch SSDT-DGPU
compile_patch SSDT-IGPU
compile_patch SSDT-PS2K
compile_patch SSDT-XLPC
compile_patch SSDT-XCPM
compile_patch SSDT-XOSI

echo ""
echo ""
