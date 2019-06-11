db.Activiteiten.aggregate([

{
        "$project": {
            "activiteitNaam":1,
            "duurtijd": { "$subtract": [ "$eindtijd", "$starttijd" ] }
        }
    },
	{
        "$group": {
            "_id": "$activiteitNaam",
            "timeAverage": { "$avg": "$duurtijd" }
        }
    }

])