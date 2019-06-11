#!/bin/bash
#checkt complexiteit van een wachtwoord

regex='(^[A-Z][a-zA-Z]{5,}[0-9]{2,}$)'
if [[ $1 =~ $regex ]]
then 
echo "paswoord geldig"
else
echo "wachtwoord moet beginnen met een hoofdletter"
echo "minstens 8 tekens lang zijn"
echo "eindigen met 2 cijfers"
fi
