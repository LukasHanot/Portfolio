 sh.addShard("localhost:27001")
 sh.addShard("localhost:27002")
 use config 
 db.settings.save({ _id:"chunksize", value: 1}) 
 use HealthE
 sh.enableSharding("HealthE")

