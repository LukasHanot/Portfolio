#!/bin/bash
#
#
AANTAL_LIJNEN=10
files=~/Dropbox/Linux/Scripts/*
for file in $files
do
ext=`echo $file | cut -d "." -f 2`
if [ "$ext" == 'sh' ] 
then
var=`wc -l $file | cut -d " " -f 1` 
if [ $var -le $AANTAL_LIJNEN -a -f $file ]
then 
echo $file
fi
fi
done
