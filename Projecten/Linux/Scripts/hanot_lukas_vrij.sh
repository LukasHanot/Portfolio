#!/bin/bash
#Examen 2de jaar 2de zit 
while true; do
memfree=`cat /proc/meminfo | grep "MemFree" | cut -d" " -f10`
echo "memfree = $memfree"
MB=`expr $memfree / 1000`
echo $MB
if [ ! $MB -le 1000 ]
then
echo -ne "Er is nog ${MB} MB geheugen vrij \033[0K\r"
# -ne (n geen newline e gebruik escape-characters)
# \033[0K verwijder characters tot (?33 plaatsen terug) 
# \r spring naar begin van lijn
else
echo -ne "Er is nog \e[31m ${MB}\e[0m MB geheugen vrij \033[0K\r"
# \e[31m \e[0m = kleur rood voor alles ertussen
fi
sleep 1

done
exit
