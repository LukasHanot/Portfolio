db.Activiteiten.aggregate(
[

{ $sort : { gebruikerid : -1, activiteit : -1} },
{ $unwind : '$metingen' },
{ $group: 
    { 
        _id: {user_id : '$gebruikerid', activity :'$activiteit'}, 
        activityType: {$first : '$activiteitNaam'},
        min_heart_rate: {$min : '$metingen.hartslag'},
        max_heart_rate: {$max : '$metingen.hartslag'},
        min_bloodpressure: {$min : '$metingen.bloeddruk.bovendruk'},
        max_bloodpressure: {$max : '$metingen.bloeddruk.bovendruk'}
    } 
},
{ $out : 'min_max_values' }
],

{allowDiskUse:true

}
)
