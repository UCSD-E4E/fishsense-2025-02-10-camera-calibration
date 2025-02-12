#!/bin/bash
mkdir ./data
sudo mount -t cifs -o credentials=$E4E_NAS_CREDS,uid=`whoami`,ro "\\\\e4e-nas.ucsd.edu\fishsense_data\2025.02.10.FishSense.NathanPool" ./data

mkdir ./lens_cal
mkdir ./lens_cal/FSL-09D
mkdir ./lens_cal/FSL-11D
sudo mount -t cifs -o credentials=$E4E_NAS_CREDS,uid=`whoami`,ro "\\\\e4e-nas.ucsd.edu\fishsense\Fishsense Lite Calibration Parameters\FSL-09D" ./lens_cal/FSL-09D
sudo mount -t cifs -o credentials=$E4E_NAS_CREDS,uid=`whoami`,ro "\\\\e4e-nas.ucsd.edu\fishsense\Fishsense Lite Calibration Parameters\FSL-11D" ./lens_cal/FSL-11D
