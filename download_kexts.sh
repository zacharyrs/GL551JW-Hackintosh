function download_bb()
{
    echo "Downloading $2:"
    curl --location --silent --output /tmp/download.txt https://bitbucket.org/RehabMan/$1/downloads/
    scrape=`grep -o -m 1 "/RehabMan/$1/downloads/$2.*\.zip" /tmp/download.txt|perl -ne 'print $1 if /(.*)\"/'`
    url=https://bitbucket.org$scrape
    curl --remote-name --progress-bar --location "$url"
}

function download_gh()
{
    echo "Downloading $2:"
    curl --location --silent --output /tmp/download.txt https://api.github.com/repos/$1/$2/releases/latest
    scrape=`grep -o -m 1 '"name": *"[^"]*"' /tmp/download.txt | grep -o '"[^"]*"$'`
    url=https://github.com/$1/$2/releases/download/$scrape/$scrape.RELEASE.zip
    curl --remote-name --progress-bar --location "$url"
}

if [ ! -d ./kexts ]; then mkdir ./kexts; fi && rm -Rf kexts/* && cd ./kexts

if [ ! -d ./LE ]; then mkdir ./LE; fi && rm -Rf LE/*
if [ ! -d ./CL ]; then mkdir ./CL; fi && rm -Rf CL/*

if [ ! -d ./tmp ]; then mkdir ./tmp; fi && rm -Rf tmp/* && cd ./tmp
if [ ! -d ./rm ]; then mkdir ./rm; fi && rm -Rf rm/* && cd ./rm
download_bb os-x-fakesmc-kozlek RehabMan-FakeSMC
download_bb os-x-voodoo-ps2-controller RehabMan-Voodoo
download_bb os-x-realtek-network RehabMan-Realtek-Network
download_bb os-x-acpi-battery-driver RehabMan-Battery
download_bb os-x-eapd-codec-commander RehabMan-CodecCommander
download_bb os-x-fake-pci-id RehabMan-FakePCIID
download_bb os-x-brcmpatchram RehabMan-BrcmPatchRAM
unzip '*.zip'
rm -rf '*/Debug'
rm -rf '*Sensors.kext'
rm -rf '*.app'
mv '*/Release/*.kext' '../../LE/'
cd ..

if [ ! -d ./vi ]; then mkdir ./vi; fi && rm -Rf vi/* && cd ./vi
download_gh vit9696 Lilu
download_gh vit9696 AppleALC
unzip '*.zip'
rm -rf '*.dSYM'
mv '*/*.kext' '../../LE/'
cd ..

if [ ! -d ./lv ]; then mkdir ./lv; fi && rm -Rf lv/* && cd ./lv
curl --remote-name --progress-bar --location https://sourceforge.net/projects/intelgraphicsfixup/files/latest/download
unzip '*.zip'
mv '*.kext' '../../LE/'
cd ..
cd ..
