#!/bin/bash
teller=0
IFS=$'\n' 
if ! [ -z $1 ]
then
for line in $(cat $1)
do
let teller=$teller+1
done
echo "$teller $1"
fi
