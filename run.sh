#!/bin/bash

run=$1

corry -c 05-run.conf -o     EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/telescope/run000${run}_ni.raw" Corryvreckan.output_directory="output_${run}";

