/*
Is er een verschil in 'caloryIntake' op weekdagen ten opzichte van weekenddagen
*/
SELECT avg(CaloriesIntake) As Average, concat("week") As Name
FROM facts_dailysnapshot2 d, dim_datum dd
WHERE d.Sk_datum = dd.DATE_SK and weekday(DATE(IN_DATE)) <= 4
UNION ALL
SELECT avg(CaloriesIntake) As Average, concat("weekend") as Name
FROM facts_dailysnapshot2 d, dim_datum dd
WHERE d.Sk_datum = dd.DATE_SK and weekday(DATE(IN_DATE)) >= 5;