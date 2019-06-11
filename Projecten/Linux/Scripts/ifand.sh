#!/bin/bash
# Functie: Voorbeeld gebruik van if en and
commando="/bin/df"

if [ -r "$commando" ] && [ -x "$commando" ]
then
 echo readable en executable
fi

if [ -r "$commando" -a -x "$commando" ]
then
 echo readable en executable
fi

if ! [ -w "$commando" ] 
then
 echo niet writable
fi
