#!/bin/bash

if [ -x /bin/df ] 
then
/bin/df -h
else
echo "Het bestand /bin/df is niet uitvoerbaar"
fi
