#!/bin/bash
#Delete een meegegeven gebruiker

if [[ -z $1 ]]
then
	echo "Een username moet meegegeven worden als argument"
	exit 1
fi
username= $1
userdel -r $username
echo "De user is samen met zijn folder verwijderd"
