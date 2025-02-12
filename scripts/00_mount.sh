#!/bin/bash
mkdir ./data
sudo mount -t cifs -o credentials=$E4E_NAS_CREDS,uid=`whoami`,ro "\\\\e4e-nas.ucsd.edu\fishsense_data\2025.02.10.FishSense.NathanPool" ./data
