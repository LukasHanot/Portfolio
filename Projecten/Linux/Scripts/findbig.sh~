#!/bin/bash
version=0.1
function showhelp {
echo "./findbig [--version || --help] [path] [minSize]"
}

function version {
echo "findbig.sh version ${version}"
}

if ! [ -z $1 ]
then
	if [ $1 = "--help" ]
	then
	showhelp
	exit 0
	fi
	if [ $1 = "--version" ]
	then
	version
	exit 0
	fi
fi

if [ -z $1 ]
then
value1="/"
value2=10
else
value1=$1
value2=$2
fi

find $value1 -type f -size "+${value2}M" -exec stat -c '%s %n' {} \;



