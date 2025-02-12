# 2025-02-10 Camera Calibration
## Processing Steps
1. Set up env
Create a `.env` that looks something like this:
```
export E4E_NAS_CREDS=/home/n.hui.813/e4e-nas-creds
```

The `e4e-nas-creds` file should look something like this:
```
username=nthui
password=abcdef1234
```
2. Init submodules (`git submodule init`; `git submodule update`)
3. Mount raw data to `./data` and lens cals to `./lens_cal`. (`scripts/00_mount.sh`)
4. Create `./fishsense-lite/runtime/.max-cpu` with the contents being the maximum number of CPUs to utilize.
5. In the `./fishsense-lite/runtime/` directory, execute `./build`.  Note that this can take around 10 minutes.
6. Interactively run the docker image:
```
docker run --rm -it --gpus=all -e NVIDIA_DRIVER_CAPABILITIES=all -v ./filtered_raws:/home/ubuntu/mnt:ro -v ./results:/home/ubuntu/Results:rw -v ./configs:/home/ubuntu/Configs:rw -v ./FSL-07D:/home/ubuntu/calibrations:ro -v ./scripts:/home/ubuntu/scripts:ro --shm-size=10.24gb `whoami`/fishsense-lite
```
See `scripts/02_docker_run.sh`
