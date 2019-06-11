#!/bin/bash
# This script shows the top 10 active programs
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
sudo ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10
