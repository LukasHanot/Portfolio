#!/bin/bash
# Change the timestamps in the dnd sessions storyline files

regex="(.)*_[[:digit:]]{1,2}_[[:digit:]]{1,2}_2017"
location=~/Dropbox/DnD/
for file in $location*
do

 if [[ $file =~ $regex ]]
 then
	echo $file
	echo $file | grep -P '(.)*_(?=[[:digit:]]{1,2})_(.)*'
	echo $dag
 fi
done
