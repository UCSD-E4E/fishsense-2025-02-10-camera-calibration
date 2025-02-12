#!/bin/bash
fsl calibrate-laser ./raw_data/ED-00/FSL-09/LaserCalibration/*.ORF \
    --lens-calibration ./calibrations/FSL-09D/fsl-09d-lens-raw.pkg \
    --rows 17 \
    --columns 24 \
    --square-size 30 \
    --output ./Results/FSL-09D/fsl-09d-laser.pkg \
    -j ./label_studio_results/project-35-at-2025-02-12-03-03-3fb00dba.json

fsl calibrate-laser ./raw_data/ED-00/FSL-11/LaserCalibration/*.ORF \
    --lens-calibration ./calibrations/FSL-11D/fsl-11d-lens-raw.pkg \
    --rows 17 \
    --columns 24 \
    --square-size 30 \
    --output ./Results/FSL-11D/fsl-11d-laser.pkg \
    -j ./label_studio_results/project-35-at-2025-02-12-03-03-3fb00dba.json