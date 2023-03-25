#!/bin/bash

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
corry -c 01-align-pre.conf -o output_directory="output_${run}" -o EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/run00${run}_ni.raw";
#corry -c 02-align_chis200.conf -o output_directory="output_${run}" -o EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/run00${run}_ni.raw" -o Tracking4D.track_model=$trackmodel -o Tracking4D.momentum="${energy}GeV";
#corry -c 03-align_chis100.conf -o output_directory="output_${run}" -o EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/run00${run}_ni.raw" -o Tracking4D.track_model=$trackmodel -o Tracking4D.momentum="${energy}GeV";
corry -c 04-align_chis50.conf -o output_directory="output_${run}" -o EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/run00${run}_ni.raw" -o Tracking4D.track_model=$trackmodel -o Tracking4D.momentum="${energy}GeV";
corry -c 05-align_millepede.conf -o output_directory="output_${run}" -o EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/run00${run}_ni.raw" -o Tracking4D.track_model=$trackmodel -o Tracking4D.momentum="${energy}GeV";

cp -r geo "output_${run}/"
