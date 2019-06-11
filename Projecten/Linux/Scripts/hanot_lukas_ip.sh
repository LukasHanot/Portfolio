#!/bin/bash
# Lukas Hanot INF201B
#
reset='\e[0m'
rood='\e[0;31m' 
blauw='\e[0;34m'
regex="[addr|Mask]+:[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"


output=`ifconfig`
for line in $output
do
if [[ $line =~ $regex ]]
then
addr=`echo $line | grep addr*`
if [ $? -eq 0 ]
then
addr=`echo $addr | cut -d ":" -f2`
echo -en "${rood}${addr}$reset/"
fi

mask=`echo $line | grep Mask*`
if [ $? -eq 0 ]
then
mask=`echo $mask | cut -d ":" -f2`
echo -e "${blauw}${mask} $reset"
fi
fi
done

