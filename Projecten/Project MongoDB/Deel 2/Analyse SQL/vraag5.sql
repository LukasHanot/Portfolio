/*
Wat is de gemiddelde dagelijkse consumptie van iedere voedingsmiddel per land op
weekenddagen en weekdagen?
*/
SELECT concat('Week'), u.Country, avg(TotalFats), avg(TotalCarbohydrats), avg(TotalFibres), avg(TotalProteins), avg(TotalSalt), avg(TotalSugars)
FROM facts_dailysnapshot2 d
JOIN dim_user u on u.IdUser = d.User_IdUser
JOIN dim_datum dd on dd.DATE_SK = d.Sk_datum
WHERE weekday(dd.IN_DATE) <5
GROUP by weekday(date(dd.IN_DATE)) <5, u.Country
UNION ALL
SELECT concat('Weekend'), u.Country, avg(TotalFats), avg(TotalCarbohydrats), avg(TotalFibres), avg(TotalProteins), avg(TotalSalt), avg(TotalSugars)
FROM facts_dailysnapshot2 d
JOIN dim_user u on u.IdUser = d.User_IdUser
JOIN dim_datum dd on dd.DATE_SK = d.Sk_datum
WHERE weekday(dd.IN_DATE) >4
GROUP by weekday(date(dd.IN_DATE)) >4, u.Country