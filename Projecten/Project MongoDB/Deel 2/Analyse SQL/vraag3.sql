/*
Geef een top tien van afvallers in de laatste week per 'KgFromTarget' categorie (hou enkel
rekening met gebruikers die de afgelopen week dezelfde 'KgFromTarget' hadden).
*/
SELECT u.KgFROMTarget, sum(d.WeightChange) as WeightLoss, u.FirstName, u.LastName, u.IdUser
FROM facts_dailysnapshot2 d
JOIN dim_datum dat on dat.DATE_SK = d.Sk_datum
JOIN dim_user u on u.key_sur_user = d.SK_USER
WHERE (dat.IN_DATE > (now() - interval 7 day) and dat.IN_DATE <= now())
and u.IdUser = d.User_IdUser
GROUP by u.IdUser, u.KgFROMTarget
order by WeightLoss desc limit 10;