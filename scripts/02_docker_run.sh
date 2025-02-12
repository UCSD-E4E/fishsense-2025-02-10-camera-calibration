#!/bin/bash
mkdir -p results
mkdir -p configs
docker run --rm -it --gpus=all -e NVIDIA_DRIVER_CAPABILITIES=all \
    -v ./data:/home/ubuntu/raw_data:ro \
    -v ./lens_cal:/home/ubuntu/calibrations:ro \
    -v ./scripts:/home/ubuntu/scripts:ro \
    -v ./results:/home/ubuntu/Results:rw \
    -v ./configs:/home/ubuntu/Configs:rw \
    --shm-size=10.24gb `whoami`/fishsense-lite
