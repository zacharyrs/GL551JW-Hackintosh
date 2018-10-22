#!/usr/bin/env bash

function download_bb()
{
    echo "Downloading $2:"
    curl --location --silent --output /tmp/download.txt https://bitbucket.org/RehabMan/$1/downloads/
    scrape=`grep -o -m 1 "/RehabMan/$1/downloads/$2.*\.zip" /tmp/download.txt|perl -ne 'print $1 if /(.*)\"/'`
    url=https://bitbucket.org$scrape
    curl --remote-name --progress-bar --location "$url"
}

if [ ! -d ./tools ]; then mkdir ./tools; fi

if [ ! -d ./output ]; then mkdir ./output; fi && cd ./output/
if [ ! -d ./efi ]; then mkdir ./efi; fi && cd ./efi/
if [ ! -d ./patches ]; then mkdir ./patches; fi && rm -Rf ./patches/*
cd ../../

if [ ! -f tools/iasl ]; then
    cd tools
    download_bb acpica iasl
    unzip 'iasl.zip'
    rm 'iasl.zip'
    cd ..
fi

# ./tools/iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p output/efi/patches/SSDT-BATT.aml patches/SSDT-BATT.dsl
./tools/iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p output/efi/patches/SSDT-DGPU.aml patches/SSDT-DGPU.dsl
./tools/iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p output/efi/patches/SSDT-HDAU.aml patches/SSDT-HDAU.dsl
./tools/iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p output/efi/patches/SSDT-HDEF.aml patches/SSDT-HDEF.dsl
./tools/iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p output/efi/patches/SSDT-IGPU.aml patches/SSDT-IGPU.dsl
./tools/iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p output/efi/patches/SSDT-XLPC.aml patches/SSDT-XLPC.dsl
./tools/iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p output/efi/patches/SSDT-PS2K.aml patches/SSDT-PS2K.dsl
./tools/iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p output/efi/patches/SSDT-XCPM.aml patches/SSDT-XCPM.dsl
./tools/iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p output/efi/patches/SSDT-XOSI.aml patches/SSDT-XOSI.dsl
./tools/iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p output/efi/patches/SSDT-ZRSC.aml patches/SSDT-ZRSC.dsl
