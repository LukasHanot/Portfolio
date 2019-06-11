#!/bin/bash 
# Functie: Tonen van het argument in kleur 
#          kleuren van output 
#ref http://www.cyberciti.biz/faq/bash-remove-whitespace-from-string/
reset='\e[0m'    # Vergeet NIET te resetten of alles blijft gekleurd!
rood='\e[0;31m' 
blauw='\e[0;34m' 

IFS=$'\n'  	
function tooninkleur() {
  shopt -q -s extglob
  # enkel 1 leading space  proces=${1/# /}
  proces=${1##*([[:space:]])}
  shopt -q -u extglob
  echo -e "$rood ${proces/ /$reset $blauw} $reset"
} 

for proces in `ps -eo pid,args`
do
  tooninkleur $proces 
done

unset IFS
