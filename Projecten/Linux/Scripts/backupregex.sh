#!/bin/bash
# Dit script vangt de vraag voor help op in het backup.sh script

regex="[-]*-+[h|H]+[elp]*$"
if [[ $@ =~ $regex ]] 
then
echo "dit is een help bericht"
fi
exit


