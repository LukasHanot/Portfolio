#!/bin/bash
# Functie: Maakt een backup van recent gewijzigde scripts
#
# Arguments: arg1 is een directory
# Auteur: Lukas Hanot
# Copyright: 
# Versie: 0.1
# Requires: blah

directory="/home/"
errorlog="/var/log/error_`basename -s .sh $0`.log"
backuplog="/var/log/backup_`basename -s .sh $0`.log"

if [[ $EUID -ne 0 ]]; then
   echo "Opstarten als root gebruiker: bv. sudo ./`basename $0`" 2>$errorlog
   exit 1
fi

if ! [[ -z $1 ]]; then
if ! [[ -d $1 ]]; then
	echo "Opstarten met een directory als eerste argument: bv. 			sudo ./`basename $0` /home" 2> $errorlog
	exit 1
	else
	directory=$1
fi;fi

find ${directory} -iname "*.sh" -mtime -5 -type f -exec tar -r -f "backup_`date +'%H%M%S'`.tar" {} \; 1> $backuplog 2> $errorlog

find ./ -iname "*.tar" -type f -exec tar -zcvf "backup_`date +'%H%M%S'`.tar.gz" {} \;
if [ $? -eq 0 ]
then
find ./ -iname "*.tar" -exec rm -f {} \;
fi
