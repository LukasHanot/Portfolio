#!/bin/bash
#
#

if [ -z $1 ]
then
echo "Gelieve een parameter mee te geven"
exit 1
fi

REGEX="^\#?${1} .*$"
filePath="/etc/apache2/apache2.conf"
egrep "${REGEX}" $filePath
if [ ! $? -eq 0 ]
then
if [[ $EUID -ne 0 ]]; then
   echo "Parameter not found in $filePath"
   echo "To make changes to the config files we'll need sudo!"
   echo "Re-run with sudo" 1>&2
   exit 1
fi
echo -n "Parameter for $1: "
read parameter
echo "$1 $parameter" >> $filePath
fi
