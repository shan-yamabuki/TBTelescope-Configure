#!/bin/bash
export PATH_TO_TB=/srv01/tau/huang/beamtest/dataset/telescope

if [[ $# == 2 ]]; then
    run=$1
    energy=$2
    trackmodel="straightline"
elif [[ $# == 3 ]]; then
    run=$1
    energy=$2
    trackmodel=$3
else
    echo "Usage: $0 {Run number (4 digits)} {Energy (GeV)} [gbl/straightline (default)]"
    exit 0
fi

# TODO: padding run number to 6 digits
corry -c 05-run.conf  -o output_directory="output_${run}" -o EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/run00${run}_ni.raw" -o Tracking4D.track_model=$trackmodel -o Tracking4D.momentum="${energy}GeV";
