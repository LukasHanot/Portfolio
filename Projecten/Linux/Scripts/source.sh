#!/bin/bash
#
#
file="/usr/share/doc/cron/changelog.Debian.gz"
ext="\\$@"
regex=".*$ext[,:]+$"

for content in `zcat "$file"`
do
if [[ $content =~ $regex ]]; then
echo "$content"
fi
done

