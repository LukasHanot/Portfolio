#!/bin/bash
# jpg bestanden een watermerk geven
#
regex='.jpg$'
#Regex voor jpg's zou ook met grep moeten werken ma ach hoe meer regexes hoe beter ofzoiets :s 
IFS=$'\n'
#Internal Field Seperator (duid aan waar info gesplit wordt) default is op newline en whitespace dus zetten we dat hier op enkel newline zodat bestanden met spaties werken


function GetLogo(){
logo=~/Downloads/logo.png
if [ ! -f $logo ]
then
wget -O $logo http://www.kdg.be/sites/default/files/logo/Logo-KdG-Horizontaal.png
convert $logo -brightness-contrast 50x25 $logo
fi
}

function maak_watermerk(){
filename=$(basename "$FILE")
filename="${filename%.*}"
#Haal enkel file naam zonder extensie uit de basis naam
merkNaam="watermerk_$filename.png"
composite -compose bumpmap -tile ${logo} $FILE $merkNaam
#composite meegekeregen in opgaven
if [ $? -eq 0 ]; then
# $? = exit value vorig commando, 0 = success
echo "Bestand $filename.jpg omgezet naar $merkNaam"
fi
}

GetLogo
for FILE in `ls .`
do
shopt -s nocasematch
# Bash magie die er voor zorgt dat er zowizo bij een vergelijking niet naar de case gekeken wordt
if [[ "$FILE" =~ $regex ]] 
then
echo $FILE
maak_watermerk
fi
done
