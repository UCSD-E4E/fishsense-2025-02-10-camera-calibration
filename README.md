# 2025-02-10 Camera Calibration
## Processing Steps
1. Init submodules (`git submodule init`; `git submodule update`)
2. Mount raw data to `./data` and lens cals to `./lens_cal`. (`scripts/00_mount.sh`)
3. Create `./fishsense-lite/runtime/.max-cpu` with the contents being the maximum number of CPUs to utilize.
4. In the `./fishsense-lite/runtime/` directory, execute `./build`.  Note that this can take around 10 minutes.
5. Interactively run the docker image:
```
docker run --rm -it --gpus=all -e NVIDIA_DRIVER_CAPABILITIES=all -v ./filtered_raws:/home/ubuntu/mnt:ro -v ./results:/home/ubuntu/Results:rw -v ./configs:/home/ubuntu/Configs:rw -v ./FSL-07D:/home/ubuntu/calibrations:ro -v ./scripts:/home/ubuntu/scripts:ro --shm-size=10.24gb `whoami`/fishsense-lite
```
See `scripts/02_docker_run.sh`
