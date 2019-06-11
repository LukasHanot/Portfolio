#!/bin/bash
# Maak thumbnails in current directory van alle .jpg bestanden
#
#

regex='.jpg$'
#Regex voor jpg's zou ook met grep moeten werken ma ach hoe meer regexes hoe beter ofzoiets :s 
IFS=$'\n'
#Internal Field Seperator (duid aan waar info gesplit wordt) default is op newline en whitespace dus zetten we dat hier op enkel newline zodat bestanden met spaties werken

function maak_thumbnail(){
filename=$(basename "$FILE")
filename="${filename%.*}"
#Haal enkel file naam zonder extensie uit de basis naam
thumbNaam="thumbnail_$filename.png"
convert -thumbnail 50x50 -extent 50x50 -gravity center "$FILE" "$thumbNaam"
#convert meegekeregen in opgaven
if [ $? -eq 0 ]; then
# $? = exit value vorig commando, 0 = success
echo "Bestand $filename.jpg omgezet naar $thumbNaam"
fi
}


for FILE in `ls .`
do
shopt -s nocasematch
# Bash magie die er voor zorgt dat er zowizo bij een vergelijking niet naar de case gekeken wordt
if [[ "$FILE" =~ $regex ]] 
# Als file regex bevat echo dan naam en do functie
then
echo $FILE
maak_thumbnail
fi
done


