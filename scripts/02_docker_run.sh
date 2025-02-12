#!/bin/bash
docker run --rm -it --gpus=all -e NVIDIA_DRIVER_CAPABILITIES=all \
    -v ./data:/home/ubuntu/raw_data:ro \
    -v ./results:/home/ubuntu/Results:rw \
    -v ./configs:/home/ubuntu/Configs:rw \
    -v ./lens_cal:/home/ubuntu/calibrations:ro \
    -v ./scripts:/home/ubuntu/scripts:ro \
    --shm-size=10.24gb `whoami`/fishsense-lite
