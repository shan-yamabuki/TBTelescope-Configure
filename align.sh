#!/bin/bash

run=$1

corry -c 01-prealignment.conf -o output_directory="output_${run}" -o EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/telescope/run000${run}_ni.raw";
corry -c 02-alignment0.conf   -o output_directory="output_${run}" -o EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/telescope/run000${run}_ni.raw";
corry -c 03-alignment1.conf   -o output_directory="output_${run}" -o EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/telescope/run000${run}_ni.raw";
corry -c 04-alignment2.conf   -o output_directory="output_${run}" -o EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/telescope/run000${run}_ni.raw";

cp -r geometries "output_${run}/"

