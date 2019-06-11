#!/bin/bash
#Couderé Francis INF102B

echo "#!/bin/bash" > kind.sh
echo 'sleep 5' >> kind.sh
echo 'kill -9 `ps aux | grep moeder | tr -s " "  | cut -d " " -f2 | head -n 1` && echo "geslaagd"' >>kind.sh
echo 'rm kind.sh' >>kind.sh

chmod 777 kind.sh


while [ 2 -ge 1 ]
do
echo "hahahahaha" 
sleep 1

done
