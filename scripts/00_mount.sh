#!/bin/bash
mkdir -p ./data
if ! mountpoint -q ./data; then
    sudo mount -t cifs -o credentials=$E4E_NAS_CREDS,uid=`whoami`,ro "\\\\e4e-nas.ucsd.edu\fishsense_data\2025.02.10.FishSense.NathanPool" ./data
fi

mkdir -p ./lens_cal/FSL-09D
mkdir -p ./lens_cal/FSL-11D
if ! mountpoint -q ./lens_cal/FSL-09D; then
    sudo mount -t cifs -o credentials=$E4E_NAS_CREDS,uid=`whoami`,ro "\\\\e4e-nas.ucsd.edu\fishsense\Fishsense Lite Calibration Parameters\FSL-09D" ./lens_cal/FSL-09D
fi
if ! mountpoint -q ./lens_cal/FSL-11D; then
    sudo mount -t cifs -o credentials=$E4E_NAS_CREDS,uid=`whoami`,ro "\\\\e4e-nas.ucsd.edu\fishsense\Fishsense Lite Calibration Parameters\FSL-11D" ./lens_cal/FSL-11D
fi

mkdir -p ./label_studio
if ! mountpoint -q ./label_studio; then
    sudo mount -t cifs -o credentials=$E4E_NAS_CREDS,uid=`whoami` "//e4e-nas.ucsd.edu/label_studio/2025-02-10_fs_data" ./label_studio
fi