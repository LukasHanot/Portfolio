#!/bin/bash
#
#

if [[ $EUID -ne 0 ]]; then
   echo "Opstarten als root gebruiker: bv. sudo ./`basename $0`"
   exit 1
fi
echo "status netcat:"
status="$(dpkg -s netcat | grep Status)"
echo $status
if [ ! "$status" == "Status: install ok installed" ]
then
  echo "netcat moet geïnstalleerd zijn om dit script te runnen"
  echo "gebruik \"sudo apt-get install netcat\" om het te instaleren"
fi

# Dit start met netcat een luisterende poort
# (optie kleine L)op poort 13
nc -l 13
poort=0
while [ $poort -le 100 ]
do
lsof -nPi tcp:$poort | grep -i "listen"
# -n geen vertaling van ip adres/naar naam (domain lookup)
# -P geen vertaling van poortnummer naar poortnaam
# -i IP protocol
let poort=$poort+1
done

