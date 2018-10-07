#!/usr/bin/env bash

function download_bb()
{
    echo "Downloading $2:"
    curl --location --silent --output /tmp/download.txt https://bitbucket.org/RehabMan/$1/downloads/
    scrape=`grep -o -m 1 "/RehabMan/$1/downloads/$2.*\.zip" /tmp/download.txt|perl -ne 'print $1 if /(.*)\"/'`
    url=https://bitbucket.org$scrape
    curl --output "$2.zip" --progress-bar --location "$url"
}

function download_gh()
{
    echo "Downloading $2:"
    curl --location --silent --output /tmp/download.txt https://api.github.com/repos/$1/$2/releases/latest
    scrape=`grep -o -m 1 '"name": *"[^"]*' /tmp/download.txt | grep -o '[^"]*$'`
    url=https://github.com/$1/$2/releases/download/$scrape/$scrape.RELEASE.zip
    if [[ $# -eq 3 ]]; then
      url=https://github.com/$1/$2/releases/download/$scrape/${scrape//$3}.RELEASE.zip
    fi
    curl --output "$2.zip" --progress-bar --location "$url"
}

if [ ! -d ./kexts ]; then mkdir ./kexts; fi && rm -Rf kexts/* && cd ./kexts

if [ ! -d ./LE ]; then mkdir ./LE; fi && rm -Rf LE/*
if [ ! -d ./CL ]; then mkdir ./CL; fi && rm -Rf CL/*

if [ ! -d ./tmp ]; then mkdir ./tmp; fi && rm -Rf tmp/* && cd ./tmp
if [ ! -d ./rm ]; then mkdir ./rm; fi && rm -Rf rm/* && cd ./rm
download_bb os-x-realtek-network RehabMan-Realtek-Network
download_bb os-x-eapd-codec-commander RehabMan-CodecCommander
download_bb os-x-fake-pci-id RehabMan-FakePCIID
download_bb os-x-brcmpatchram RehabMan-BrcmPatchRAM
unzip -qqo '*.zip'
rm -rf Debug
rm -rf *Sensors.kext
rm -rf *.app
rm -rf FakePCIID_AR9280_as_AR946x.kext FakePCIID_BCM57XX_as_BCM57765.kext FakePCIID_Intel_GbX.kext
rm -rf BrcmFirmwareData.kext BrcmNonPatchRAM.kext BrcmPatchRAM.kext
rm -rf Release/FakePCIID_AR9280_as_AR946x.kext Release/FakePCIID_BCM57XX_as_BCM57765.kext Release/FakePCIID_Intel_GbX.kext Release/FakePCIID_Intel_HD_Graphics.kext Release/FakePCIID_Intel_HDMI_Audio.kext
rm -rf Release/BrcmFirmwareData.kext Release/BrcmNonPatchRAM.kext Release/BrcmNonPatchRAM2.kext Release/BrcmPatchRAM.kext
mv Release/*.kext ../../LE/
cd ..


if [ ! -d ./ac ]; then mkdir ./ac; fi && rm -Rf ac/* && cd ./ac
download_gh acidanthera Lilu
download_gh acidanthera AppleALC
download_gh acidanthera WhateverGreen
download_gh acidanthera VirtualSMC
download_gh acidanthera AirportBrcmFixup v
unzip -qqo '*.zip'
rm -rf *.dSYM
mv *.kext ../../LE/
mv Drivers/VirtualSmc.efi ../../CL/
mv Kexts/SMCBatteryManager.kext Kexts/VirtualSMC.kext ../../LE/
cd ../../


rm -rf tmp


cd LE
cp -R VirtualSMC* FakePCIID* RealtekRTL8111* Lilu* WhateverGreen* AirportBrcmFixup* ../CL/
echo "Downloading AppleBacklightInjector:"
mkdir -p 'AppleBacklightInjector.kext/Contents'
curl --output 'AppleBacklightInjector.kext/Contents/Info.plist' --progress-bar --location https://raw.githubusercontent.com/RehabMan/HP-ProBook-4x30s-DSDT-Patch/master/kexts/AppleBacklightInjector.kext/Contents/Info.plist
cd ../../
