#!/bin/bash
# Functie: emulatie van cut -c
#          oproepen met $0 -c2-10 bestandsnaam

cutme=false
eerste=$1
echo eerste arg $1
shift
optie=${eerste:0:2}
if [ $optie = "-c" ]; then
  cutme=true
  van=${eerste#-c}; van=${van%-*} van=$(($van-1))
  tot=${eerste##*-}
  lengte=$(($tot-$van))
fi

OLDIFS=$IFS
IFS=$'\n'
for lijn in `cat "$@"` 
do
  if $cutme  
    then
    lijn=${lijn:$van:$lengte}
  fi
    echo $lijn
done
IFS=$OLDIFS
#unset IFS
