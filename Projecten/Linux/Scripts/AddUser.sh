#!/bin/bash
#Creëert nieuwe gebruiker(s) op een linux systeem
#Elke meegegeven parameter wordt een gebruiker
if [[ -z $1 ]]
then
	echo "een gebruikersnaam meegeven als argument is vereist"
	exit 1
fi
i= 1
while [ $($i) -le $# ]
do
username= $($i)
sudo useradd $username -m -s /bin/bash
sudo passwd $username
echo "$username added"
i=i++
done
