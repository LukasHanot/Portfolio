#!/bin/bash
for file in `ls /proc/*/cmdline`
do
if [ -f "${file}" ]; then
	inhoud=`cat ${file}` 
	if [ -n "$inhoud" ]; then 
		echo "$file: $inhoud" | grep 'sbin'
		fi
fi
done
