db.Activiteiten.aggregate([

{
        "$project": {
            "activiteit": 1,
            "activiteitNaam":1,
            "calVerbrand":1,
            "duurtijd": { "$subtract": [ "$eindtijd", "$starttijd" ] }
        }
    },
	{
        "$group": {
            "_id": "$activiteitNaam",
            "duurTijd":{"$sum": "$duurtijd"},
            "totaalVerbrand":{"$sum": "$calVerbrand"}
        }
    },
        { "$sort" : { "totaalVerbrand" : 1 } }
])