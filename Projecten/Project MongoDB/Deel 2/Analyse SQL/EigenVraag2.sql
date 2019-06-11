
SELECT avg(TotalSugars) As gemiddelde_suikers, concat("Weekdagen") As Name
FROM facts_dailysnapshot2 d, dim_datum dd
WHERE d.Sk_datum = dd.DATE_SK and weekday(DATE(IN_DATE)) <= 4
UNION ALL
SELECT avg(TotalSugars) As Average, concat("Weekend") as Name
FROM facts_dailysnapshot2 d, dim_datum dd
WHERE d.Sk_datum = dd.DATE_SK and weekday(DATE(IN_DATE)) >= 5;