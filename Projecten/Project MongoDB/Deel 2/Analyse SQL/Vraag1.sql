/*
Wat is de gemiddelde gewichtswijziging per dag per categorie 'KgFromTarget'
*/
SELECT d.Sk_datum, avg(d.WeightChange) as WeightChange, u.KgFROMTarget
FROM facts_dailysnapshot2 d
JOIN dim_user u on u.IdUser = d.User_IdUser
GROUP by KgFROMTarget, Sk_datum order by Sk_datum asc;
