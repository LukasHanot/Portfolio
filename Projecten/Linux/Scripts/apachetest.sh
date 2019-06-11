#!/bin/bash
if ! [ "`service apache2 status`" = " * apache2 is running" ]
then
sudo service apache2 start
fi

error_geen_ab="Het programma ab is nodig. installeren kan met 'sudo apt-get install apache2-utils'"
command -v ab >/dev/null || (echo $error_geen_ab >&2 && exit 1);

URL="127.0.0.1"
if ! [ -z $1 ]
then
URL=$1
fi

curl -o /dev/null --silent --head --connect-timeout 1 ${URL}
if [ $? -ne 0 ]
then
echo "${URL} is niet bereikbaar"
exit 2
else
echo "${URL}: Friendly com-station detected"
fi

echo "Running Diagnostics"
echo "==================="
ab -kc 10 -n 100 "${URL}/"
