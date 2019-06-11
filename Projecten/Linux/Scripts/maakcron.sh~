#!/bin/bash
CRONTAB_NOHEADER='N'
regex='[-]*-+[h|H]+[elp]*$'
errorlog="/var/log/maakcron.log"
echo 
if [[ $EUID -ne 0 ]]; then
   echo "Opstarten als root gebruiker: bv. sudo ./`basename $0`" 2>$errorlog
   exit 1
fi

if [[ ! -z $1 ]]; then
param="$1"
	if [ "$param" == "--remove" ]
	then
	file=`basename "$2"`
	rm /etc/cron.d/$file.cron
	exit 0
	fi
	if [[ $param =~ $regex ]]
	then
	echo "Usage: sudo ./maakcron.sh [ --remove] command"
	echo "	--remove	Remove cron file"
	echo "	--help		Display this help message"
	exit 0
	fi	
	if [ -f $param -a -x $param -a -r $param ] 
	then
	#crontab -l > tempCron
	echo "SHELL=/bin/sh" >> tempCron
	echo "PATH=/sbin:/bin:/usr/sbin:/usr/bin" >> tempCron
	echo "(0-59)  (0-23) (1-31)  (1-12) (0-6)" >> tempCron
	echo "* * * * * root `readlink -f $param`" >> tempCron
	cp ./tempCron /etc/cron.d/$param.cron
	rm ./tempCron
	fi
fi


