#!/bin/bash
#Examen 2de jaar 2de zit
#Zoek met behulp van een for-loop naar woorden met meer dan 3 klinkers in een meegegeven bestand 

PAT='\b([^aeiou\W]*[aeiuo]){3,}[^aeiou\W]*\b'
# \b geeft aan dat dit om volledige woorden gaat
# ^aeiou\W zoekt woord karakters die geen klinkers zijn
# [aeiuo] zoekt de klinkers
# {3,} het aantal klinkers dat moet worden gevonden
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
