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
7. Prep the docker environment

`scripts/03_docker_prep.sh`
```
fsl generate-ray-config --max-cpu 8 --max-gpu 1
```
8. Preprocess the laser calibrations

`scripts/04_preprocess_laser_data.sh`
```
fsl preprocess ./raw_data/ED-00/FSL-09/LaserCalibration/*.ORF --format JPG \
    --lens-calibration ./calibrations/FSL-09D/fsl-09d-lens-raw.pkg \
    --output Results/FSL-09D/processed_lasers/
fsl preprocess ./raw_data/ED-00/FSL-11/LaserCalibration/*.ORF --format JPG \
    --lens-calibration ./calibrations/FSL-11D/fsl-11d-lens-raw.pkg \
    --output Results/FSL-11D/processed_lasers/
```
9. Copy images to label studio.  Note that this should be done outside of docker

`scripts/05_copy_label_studio_data.sh`
10. Set up https://labeler.e4e.ucsd.edu

Labeling Interface:
```
<View>
  <KeyPointLabels name="kp-1" toName="img-1">
    <Label value="Red Laser" background="red"/>
    <Label value="Green Laser" background="green"/>
  </KeyPointLabels>
  <Image name="img-1" value="$img" zoom="true" zoomControl="true"/>
</View>
```

Storage backend:
```
Storage Type: Synology
Storage Title: 2025-02-10_fs_data
URL: https://e4e-nas.ucsd.edu:6021
Path: /label_studio/2025-02-10_fs_data
Username: label_studio
Password: ********
File Filter Regex: .*JPG
Treat every bucket object as a source file: True
```
11. Export the label studio project results into ./label_studio_results
12. Run the laser calibration script

`scripts/06_laser_checkerboard_calibrate.sh`
```
fsl calibrate-laser ./raw_data/ED-00/FSL-09/LaserCalibration/*.ORF \
    --lens-calibration ./calibrations/FSL-09D/fsl-09d-lens-raw.pkg \
    --rows 14 \
    --columns 10 \
    --square-size 41 \
    --output ./Results/FSL-09D/fsl-09d-laser.pkg \
    -j ./label_studio_results/project-35-at-2025-02-12-03-03-3fb00dba.json

fsl calibrate-laser ./raw_data/ED-00/FSL-11/LaserCalibration/*.ORF \
    --lens-calibration ./calibrations/FSL-11D/fsl-11d-lens-raw.pkg \
    --rows 14 \
    --columns 10 \
    --square-size 41 \
    --output ./Results/FSL-11D/fsl-11d-laser.pkg \
    -j ./label_studio_results/project-35-at-2025-02-12-03-03-3fb00dba.json
```
13. Check results in command line output

## Notes
Currently failing on step 12 on kastner-ml