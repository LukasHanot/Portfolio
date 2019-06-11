#!/bin/bash
if [ -e /bin/df ]
then 
if ! [ -r /bin/df -a -x /bin/df ]
then
/bin/df
else
echo "/bin/df is niet uitvoerbaar"
exit 2
fi
else
echo "/bin/df bestaat niet"
exit 1
fi
