IFS=$'\n'
spacedir="./Program Files"
spacebestand1="test bestand 1.txt"
spacebestand2="test bestand 2.txt"
mkdir $spacedir 2>/dev/null
echo " " > $spacedir/$spacebestand1
echo " " > $spacedir/$spacebestand2
for file in `ls $spacedir`
do 
echo $file
done 