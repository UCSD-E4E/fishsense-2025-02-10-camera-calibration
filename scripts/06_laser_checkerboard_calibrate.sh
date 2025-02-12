#!/bin/bash
fsl calibrate-laser ./raw_data/ED-00/FSL-11/LaserCalibration/*.ORF \
    --lens-calibration ./calibrations/FSL-11D/fsl-11d-lens-raw.pkg \
    --rows 14 \
    --columns 10 \
    --square-size 41 \
    --output ./Results/FSL-11D/fsl-11d-laser.pkg \
    -j ./label_studio_results/fsl-11d.json

fsl calibrate-laser ./raw_data/ED-00/FSL-09/LaserCalibration/*.ORF \
    --lens-calibration ./calibrations/FSL-09D/fsl-09d-lens-raw.pkg \
    --rows 14 \
    --columns 10 \
    --square-size 41 \
    --output ./Results/FSL-09D/fsl-09d-laser.pkg \
    -j ./label_studio_results/fsl-09d.json
