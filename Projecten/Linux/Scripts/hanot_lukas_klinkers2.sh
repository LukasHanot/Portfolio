#!/bin/bash
#Voorbeeld examen
#Zoek met behulp van een for-loop naar woorden met meer dan 5 opeenvolgende klinkers in een meegegeven bestand 

PAT='^[a-z]*[aeiuo]{5,}[a-z]*$'
# [a-z] alle karakters of geen voor de klinkers
# [aeiuo]{5,} Zoek 5 opeenvolgende klinkers
# [a-z]*$ alle karakters tot einde van het woord
# Fuck regex' zijn moeilijk xD

function heeftklinker {
if [[ "$LINE" =~ $PAT ]]
#Check of het woord past in de regex
then
echo -e "\e[31m$LINE\e[0m" 
fi 
}

if [ -f "$1" ]
# als bestand bestaat
then
for LINE in `cat "$1"`
# voor elke lijn in bestand
do 
heeftklinker
# doe functie
done
else
echo "Woordenboek $1 niet gevonden" 
fi
