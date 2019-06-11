db.Activiteiten.aggregate([
{
    $group: {
        "_id": "$activiteitNaam",
        avgStartLat: {$avg: "$startgps.latitude"},
        avgStartLong: {$avg: "$startgps.longitude"},
        avgStopLat: {$avg: "$eindgps.latitude"},
        avgStopLong: {$avg: "$eindgps.longitude"}
        }
},{
    $project: {
        "_id": "$_id",
        avgAfstand: { 
                $sqrt: { 
                    $add: [{ 
                    $pow: [{ 
                    $subtract: [ "$avgStartLat", "$avgStartLong" ]}
                    ,2] 
                    ,
                    $pow:[{ 
                    $subtract: [ "$avgStopLat", "$avgStopLong" ]}
                    ,2]
                }]
            }
        }
     }
   }
])