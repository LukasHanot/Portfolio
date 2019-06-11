::Maakt de folders aan voor de shards en configserver
if not exist "C:\MongodbServers" mkdir C:\MongodbServers
if not exist "C:\MongodbServers\shard1" mkdir C:\MongodbServers\shard1
if not exist "C:\MongodbServers\shard2" mkdir C:\MongodbServers\shard2
if not exist "C:\MongodbServers\configserver" mkdir C:\MongodbServers\configserver
::Current Directory veranderen naar de installatie folder \bin
cd "C:\Program Files\MongoDB\Server\3.2\bin"
::Controleren of pad juist is
set /p DUMMY=Hit Controleer pad, Hit ENTER to continue...

::Volgende commando's worden allemaal uitgevoerd op pad "C:\Program Files\MongoDB\Server\3.2\bin" telkens in een nieuwe shell
start cmd /k mongod --dbpath C:\MongodbServers\shard1 --port 27001
timeout 3
start cmd /k mongod --dbpath C:\MongodbServers\shard2 --port 27002
timeout 3
start cmd /k mongod --dbpath C:\MongodbServers\configserver --port 27003 --configsvr
timeout 3
start cmd /k mongos --port 27010 --configdb localhost:27003
timeout 3


::Shards toevoegen en settings in config zetten -- in mongo shell
if not exist "C:\MongodbServers\configserver\bestaat" start /WAIT cmd /c "mongo --host localhost --port 27010 < C:\temp\mongocommands.js"
::Start importeren van data -- in MongoDB\Server\3.2\bin shell
if not exist "C:\MongodbServers\configserver\bestaat" START /WAIT mongoimport --port 27010 --db HealthE --collection Activiteiten --type json --file C:\temp\mongoTestData.json
::Index plaatsen en sharding starten -- in mongo shell
if not exist "C:\MongodbServers\configserver\bestaat" start cmd /c "mongo --host localhost --port 27010 < C:\temp\mongocommands2.js"
::Opstart controle toevoegen
::Dit voegt een folder toe in de config server zodat bij
:: volgende runs van dit script deze folder wordt opgemerkt 
:: en daardoor de configuratie en imports niet opnieuw uitvoert
if not exist "C:\MongodbServers\configserver\bestaat" mkdir C:\MongodbServers\configserver\bestaat
::Enter om het venster te sluiten
set /p DUMMY=Hit Startup completed, ENTER to continue...