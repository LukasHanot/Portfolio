#!/bin/bash

regex="(.)*[0-9]{1,3}\+"
for file in ./*
do
rename 's/(.)*(\d{1}+)(\d{2}+)(.)*/Mythbusters S0${2}E${3}.avi/' $file -vn

done
