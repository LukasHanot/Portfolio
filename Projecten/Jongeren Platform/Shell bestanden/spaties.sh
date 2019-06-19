spacedir="./Program Files"
spacebestand1="test bestand 1.txt"
spacebestand2="test bestand 2.txt"


if [ -d "$spacedir" ]
then
echo "Ge he ol een mapke"
else
mkdir "$spacedir"
fi

echo "This is some text" > "$spacebestand1"
echo "This is some text" > "$spacebestand2"

mv "$spacebestand1" "$spacedir"
mv "$spacebestand2" "$spacedir"
OLD_IFS="$IFS"
IFS=$'\n'
for filename in `ls "$spacedir"`; do
echo $filename
done
IFS="$OLD_IFS"


