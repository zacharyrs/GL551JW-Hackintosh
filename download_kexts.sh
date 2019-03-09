#!/usr/bin/env bash

function download_rm()
{
    echo "... $2:"
    curl --location --silent --output /tmp/download.txt https://bitbucket.org/RehabMan/$1/downloads/
    scrape=`grep -o -i -m 1 "/RehabMan/$1/downloads/$2.*\.zip" /tmp/download.txt | perl -ne 'print $1 if /(.*)\"/'`
    url=https://bitbucket.org$scrape
    echo $url
    curl --output "$2.zip" --progress-bar --location "$url"
}

function download_gh()
{
    echo "... $2:"
    curl --location --silent --output /tmp/download.txt https://api.github.com/repos/$1/$2/releases/latest
    tag=`grep '"tag_name":' /tmp/download.txt | sed -E 's/.*"([^"]+)".*/\1/'`
    rls=`grep '"name":' /tmp/download.txt | grep RELEASE | sed -E 's/.*"([^"]+)".*/\1/'`
    url=https://github.com/$1/$2/releases/download/$tag/$rls
    echo $url
    curl --output "$2.zip" --progress-bar --location "$url"
}

echo "Downloading kexts (and drivers)"

if [ ! -d ./output ]; then mkdir ./output; fi && cd ./output/

if [ ! -d ./local ]; then mkdir ./local; fi && cd ./local/
if [ ! -d ./kexts ]; then mkdir ./kexts; fi && rm -Rf kexts/*
# if [ ! -d ./installme ]; then mkdir ./installme; fi && cd ./installme/
# if [ ! -d ./asussmc ]; then mkdir ./asussmc; fi && rm -Rf asussmc/*
cd ../

if [ ! -d ./efi ]; then mkdir ./efi; fi && cd ./efi/
if [ ! -d ./kexts ]; then mkdir ./kexts; fi && rm -Rf kexts/*
if [ ! -d ./drivers ]; then mkdir ./drivers; fi && rm -Rf drivers/*
cd ../

if [ ! -d ./tmp ]; then mkdir ./tmp; fi && rm -Rf tmp/* && cd ./tmp/
if [ ! -d ./rm ]; then mkdir ./rm; fi && rm -Rf rm/* && cd ./rm/
download_rm os-x-realtek-network RehabMan-Realtek-Network
download_rm os-x-eapd-codec-commander RehabMan-CodecCommander
download_rm os-x-fake-pci-id RehabMan-FakePCIID
download_rm os-x-brcmpatchram RehabMan-BrcmPatchRAM
download_rm AppleBacklightFixup RehabMan-BacklightFixup
unzip -qqo '*.zip'
rm -rf Debug
rm -rf *Sensors.kext
rm -rf *.app
rm -rf Release/FakePCIID_AR9280_as_AR946x.kext Release/FakePCIID_BCM57XX_as_BCM57765.kext Release/FakePCIID_Intel_GbX.kext Release/FakePCIID_Intel_HD_Graphics.kext
rm -rf Release/BrcmFirmwareData.kext Release/BrcmNonPatchRAM.kext Release/BrcmNonPatchRAM2.kext Release/BrcmPatchRAM.kext
mv Release/*.kext ../../local/kexts/
cd ../


if [ ! -d ./ac ]; then mkdir ./ac; fi && rm -Rf ac/* && cd ./ac/
download_gh acidanthera Lilu
download_gh acidanthera AppleALC
download_gh acidanthera WhateverGreen
download_gh acidanthera VirtualSMC
download_gh acidanthera AirportBrcmFixup
download_gh acidanthera AptioFixPkg
download_gh acidanthera AppleSupportPkg
unzip -qqo '*.zip'
rm -rf *.dSYM
mv *.kext ../../local/kexts/
rm Drivers/UsbKbDxe.efi
mv Drivers/*.efi ../../efi/drivers/
mv Kexts/SMCBatteryManager.kext Kexts/VirtualSMC.kext ../../local/kexts/
cd ../


# Reverted from AsusSMC - didn't work...
# if [ ! -d ./hp ]; then mkdir ./hp; fi && rm -Rf hp/* && cd ./hp/
# download_gh hieplpvip AsusSMC
# unzip -qqo '*.zip'
# rm -rf *.dSYM
# rm -rf *.zip
# mv *.kext ../../local/kexts/
# mv * ../../local/installme/asussmc/
# cd ../../

cd ../

rm -rf tmp

cp -R ../smrttchpd/* ./local/kexts/

cd ./local/kexts/
shopt -s extglob
cp -R !(AppleALC*|AppleBacklightFixup*|AsusNBFnKeys*|*Brcm*|CodecCommander*|FakePCIID_Intel_HDMI_Audio*)  ../../efi/kexts/
shopt -u extglob
cd ../../



echo ""
echo ""
