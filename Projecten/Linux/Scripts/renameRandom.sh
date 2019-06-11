#!/bin/bash

for file in ./*
do
#rename 's/(\d{2}+)-(.*)/Another S01E${1}.mkv/' $file 
rename -n 's/(.*+)\[([0-9]{3,4})p\](.*)/Black Lagoon S01E${1}.mkv/' $file 
done
