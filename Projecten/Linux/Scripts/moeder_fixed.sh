#!/bin/bash
#Couderé Francis INF102B
#Ik heb een oplossing gevonden 
#1)kind werd nog niet opgeroepen
#2)door "&" erachter te zetten blijft het script lopen
#Lukas Hanot

echo "#!/bin/bash" > kind.sh
echo 'sleep 5' >> kind.sh
echo 'kill -9 `ps aux | grep moeder | tr -s " "  | cut -d " " -f2 | head -n 1` && echo "geslaagd"' >>kind.sh
echo 'rm kind.sh' >>kind.sh

chmod 777 kind.sh
./kind.sh &

while [ 2 -ge 1 ]
do
echo "hahahahaha" 
sleep 1

done
