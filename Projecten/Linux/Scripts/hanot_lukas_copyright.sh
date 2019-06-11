#!/bin/bash
# Lukas Hanot INF201B
loc=/usr/share/doc/l*
if [ ! -z $1 ]; then
loc=$1
fi

function fun_md5()
{
md5sum $dir/$file
if [ ! $? -eq 0 ] ;then
exit 2
fi
}

for dir in `ls -d $loc`
do
for file in `ls $dir`
do
if [[ $file =~ "copyright" ]]
then
fun_md5 $file
fi
done
done
