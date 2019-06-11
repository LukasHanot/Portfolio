#!/bin/bash
# Functie: velden uit syslog halen met regex 
#          De kernel berichten mag je negeren
logfile="/var/log/syslog"
tmpfile="`basename $0`.tmp"

rm -f "$tmpfile" 2>/dev/null
IFS=$'\n'
a="[[:alpha:]]"
d="[[:digit:]]"
regex="$a$a$a $d$d $d$d:$d$d:$d$d $a+ (.*)\[$d+\]: (.*)"
# rekening houdend met 1 cijfer of 2 cijferige dag en hostname ingevuld:
regex="$a{3} [ 0-9]$d $d{2}:$d{2}:$d{2} `hostname` (.*)\[$d+\]: (.*)"
#content='Jan 31 20:02:36 kdguntu ntpd_intres[10245]: host name not found'

for content in `cat $logfile` 
do
  [[ $content =~ $regex ]] 
  echo "${BASH_REMATCH[1]} ${BASH_REMATCH[2]}" >> "$tmpfile"

done

cat "$tmpfile" | sort | uniq -c | sort -g | grep -v info

#rm -f "$tmpfile" 2>/dev/null
# ook kernel match
#regex="$a$a$a $d$d $d$d:$d$d:$d$d $a+ (.*)(\[$d+\]){0,1}: (.*)"
