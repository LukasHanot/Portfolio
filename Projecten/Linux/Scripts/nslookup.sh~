#!/bin/bash
# Lukas Hanot
#
# omzetten van ip adressen naar namen

REGEX='^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
inputfile="ips.txt"
echo "109.74.196.225" > ips.txt
echo "91.189.90.40" >> ips.txt
echo "173.194.34.168" >> ips.txt

function fun_lookup(){
data=`nslookup $ip`
# # van begin tot en met name
data1=${data#*name = }
# % van einde tot en met Authori
naam=${data1%Authori*}
echo $naam
}

if [[ ! -z $1 && $1 =~ $REGEX ]]
then
ip=$1
fun_lookup
exit 0
fi


for LINE in `cat $inputfile`
do
ip=$LINE
fun_lookup
done

