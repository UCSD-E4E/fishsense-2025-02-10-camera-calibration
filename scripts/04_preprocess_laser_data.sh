#!/bin/bash
fsl preprocess ./raw_data/ED-00/FSL-09/LaserCalibration/*.ORF --format JPG \
    --lens-calibration ./calibrations/FSL-09D/fsl-09d-lens-raw.pkg \
    --output Results/FSL-09D/processed_lasers/
fsl preprocess ./raw_data/ED-00/FSL-11/LaserCalibration/*.ORF --format JPG \
    --lens-calibration ./calibrations/FSL-11D/fsl-11d-lens-raw.pkg \
    --output Results/FSL-11D/processed_lasers/