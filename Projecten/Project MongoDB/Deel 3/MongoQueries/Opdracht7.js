db.min_max_values.aggregate(
[
{ $group: 
    { 
        _id: '$activityType', 
        highest_heart_rate : { $max: '$max_heart_rate'},
        highest_bloodpressure : { $max : '$max_bloodpressure'}
     } 
},
{ $sort : { max_heart_rate : -1, highest_bloodpressure : -1,}}
]
)

