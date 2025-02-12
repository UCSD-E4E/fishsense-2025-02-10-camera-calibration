#!/bin/bash
if mount | grep '//e4e-nas.ucsd.edu/fishsense_data/2025.02.10.FishSense.NathanPool' > /dev/null; then
    sudo umount ./data
fi
if mount | grep '//e4e-nas.ucsd.edu/fishsense/Fishsense Lite Calibration Parameters/FSL-09D' > /dev/null; then
    sudo umount ./lens_cal/FSL-09D
fi
if mount | grep '//e4e-nas.ucsd.edu/fishsense/Fishsense Lite Calibration Parameters/FSL-11D' > /dev/null; then
    sudo umount ./lens_cal/FSL-11D
fi
if [ -d './data' ]; then
    rmdir ./data
fi
if [ -d './lens_cal' ]; then
    rm -rf ./lens_cal
fi