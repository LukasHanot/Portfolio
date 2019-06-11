#!/bin/bash
# Nakijken of commando df bestaat
# output tonen van commando df voor
# Kijk na of het commando /bin/df bestaat
commando="/bin/df"

if ! [ -e "$commando" ]; then
  echo $commando bestaat niet 
  exit 1
fi

if [ -x "$commando" ] && [ -r "$commando" ]; then
  $commando -h 
else
  echo $commando is niet uitvoerbaar
  exit 1
fi
exit 0
