#!/bin/bash

run=$1

corry -c 01-prealignment.conf -o    EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/telescope/run000${run}_ni.raw" Corryvreckan.output_directory="output_${run}";
corry -c 02-alignment0.conf -o    EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/telescope/run000${run}_ni.raw" Corryvreckan.output_directory="output_${run}";
corry -c 03-alignment1.conf -o    EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/telescope/run000${run}_ni.raw" Corryvreckan.output_directory="output_${run}";
corry -c 04-alignment2.conf -o    EventLoaderEUDAQ2.file_name="${PATH_TO_TB}/telescope/run000${run}_ni.raw" Corryvreckan.output_directory="output_${run}";

cp -r geometries "output_${run}/"

