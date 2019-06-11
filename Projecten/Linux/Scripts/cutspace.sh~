#!/bin/bash
# Verwijdert alle underscores uit bestand namen in specifieke map
# 
# Functions
function createFiles(){
MAXCOUNT=10
count=1
while [ "$count" -le $MAXCOUNT ]
do
  text=$RANDOM
  echo $text
  echo $text > "bestand $RANDOM.txt"
  let "count += 1"
done
}

# Default
loc="~/Desktop"
dir="Foo"
default_map="${loc}/${dir}"
if [ -z $1 ]
then
eval mkdir $default_map
eval cd $default_map
createFiles
fi

# Script
location=${1:-$default_map}
eval cd $location
for f in *
do
newName=`echo ${f//" "/"_"}`
mv "${f}" "${newName}"
done

