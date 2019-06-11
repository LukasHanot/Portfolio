adir="/etc/apache2"
confs="$adir/apache2.conf $adir/ports.conf"

if [ -z $1 ]
then
echo "geen argument ingegeven"
exit 1
fi

for FILE in $confs
do
if [ -f $FILE ]
then
grep -iHn "$1" $FILE
fi
done
