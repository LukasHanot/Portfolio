mongoStartupScript - mini how to:

1. Kopieer alle bestanden uit MongoSharding naar de C:\temp folder.
2. dubbelklik het mongoStarupScript
3. klik op enter wanneer de prompt hier naar vraagt

cmd command: cp %USER%\Dropbox\oplevering\Deel3\MongoSharding\* C:\temp\

moest een mongo shell noodzakelijk zijn gebruik dan:
cmd: cd "C:\Program Files\MongoDB\Server\3.2\bin"
cmd: mongo --port 27010 --configdb localhost:27003

INFO: De folder genaamd "bestaat" wordt aangemaakt in de config folder
enkel en ter controle of het de eerste keer is dat het script wordt gerunt
zodat bij een 2de opstart niet de data opnieuw wordt geïmport
en dat de configuratie niet opnieuw wordt uitgevoerd