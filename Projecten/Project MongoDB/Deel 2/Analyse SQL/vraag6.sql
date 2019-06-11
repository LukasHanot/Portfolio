/*
Hoeveel nieuwe gebruikers zijn er bij gekomen in de laatste week?
*/
SELECT sum(d.CaloriesIntake) - sum(d.CaloriesUsedFROMActivities) as nettoCaloryIntake, d.User_IdUser, concat('Week ', week(date(dd.IN_DATE))) as Week
FROM facts_dailysnapshot2 d
JOIN dim_datum dd on dd.DATE_SK = d.Sk_datum
GROUP by d.User_IdUser, week(date(dd.IN_DATE));
