#!/bin/bash
#
# Plays an alarm when a site is back online
# To check another webpage add a parameter in the form of "http://example.com"
# standard webpage is "http://google.com
#


# Nakijken of er argumenten werden meegegeven
webpagina=http://www.google.com/
regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

if [ ! -z "$1" ]
then
   if [[ $1 =~ $regex ]]
   then
     echo Controleer pagina $1
     webpagina=$1
   fi
fi 

while ! curl -sm 10 http://www.google.com/ >/dev/null
do echo still down
sleep 1m 
done 
mplayer -really-quiet /usr/share/sounds/freedesktop/stereo/complete.oga
