#!/usr/bin/env bash

source serials.sh

for f in config*.plist.src; do
  cp $f ${f%.*}
done

for f in config*.plist; do
  /usr/libexec/PlistBuddy -c "Set :SystemParameters:CustomUUID string $UUID" $f
  /usr/libexec/PlistBuddy -c "Set :SMBIOS:SmUUID string $UUID" $f
  /usr/libexec/PlistBuddy -c "Set :SMBIOS:SerialNumber string $SN" $f
  /usr/libexec/PlistBuddy -c "Set :SMBIOS:BoardSerialNumber string $MLB" $f
  /usr/libexec/PlistBuddy -c "Set :RtVariables:MLB string $MLB" $f
  /usr/libexec/PlistBuddy -c "Set :RtVariables:ROM data $ROM" $f
done
