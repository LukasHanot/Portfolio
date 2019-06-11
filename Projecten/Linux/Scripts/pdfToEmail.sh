#!/bin/sh
####

for file in *.pdf; do
	emailpdf=$(pdftotext "$file" - | grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b")
	echo "pdf email from: $emailpdf"
echo $emailpdf >> ./emailadressen.txt
done 

for fileWord in *.{docx,doc}; do
	emailword=$(docx2txt < $fileWord | grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b")
	echo "docx email from: $emailword"
echo $emailword >> ./emailadressen.txt
done

count=$(find . -type f|wc -l)
echo "Amount of files: $count"
cut -d' ' -f1 emailadressen.txt >> emailadressen2.txt
sed -i '/^$/d' emailadressen2.txt 
echo "Amount of emails: `cat emailadressen2.txt | wc -l`"
