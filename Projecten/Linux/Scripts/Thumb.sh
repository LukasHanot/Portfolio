#!/bin/bash
#This script looks for a file named thumb.txt on the desktop and prints it contents 
IFS=''
clear
while read p; do
 echo $p
sleep 0.2
done < ./thumb.txt
