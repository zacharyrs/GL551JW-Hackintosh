#!/usr/bin/env bash

echo "Patching configs w/ serials"

source serials.sh

if [ ! -d ./output ]; then mkdir ./output; fi && cd ./output
if [ ! -d ./efi ]; then mkdir ./efi; fi
cd ../

cd ./configs/
for f in config*.plist; do
  cp $f ../output/efi/${f}
done

cd ../output/efi/

for f in config*.plist; do
  /usr/libexec/PlistBuddy -c "Delete :SMBIOS:SmUUID" $f
  /usr/libexec/PlistBuddy -c "Delete :SMBIOS:SerialNumber" $f
  /usr/libexec/PlistBuddy -c "Delete :SMBIOS:BoardSerialNumber" $f
  /usr/libexec/PlistBuddy -c "Delete :RtVariables:MLB" $f
  /usr/libexec/PlistBuddy -c "Delete :RtVariables:ROM" $f
  /usr/libexec/PlistBuddy -c "Add :SMBIOS:SmUUID string $UUID" $f
  /usr/libexec/PlistBuddy -c "Add :SMBIOS:SerialNumber string $SN" $f
  /usr/libexec/PlistBuddy -c "Add :SMBIOS:BoardSerialNumber string $MLB" $f
  /usr/libexec/PlistBuddy -c "Add :RtVariables:MLB string $MLB" $f
  /usr/libexec/PlistBuddy -c "Add :RtVariables:ROM data $ROM" $f
done

cd ../../

echo ""
echo ""
