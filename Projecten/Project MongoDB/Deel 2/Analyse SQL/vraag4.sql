/*
Bereken per gebruiker de gemiddelde intake van de verschillende voedingsstoffen
*/
SELECT User_IdUser, avg(TotalFats), avg(TotalCarbohydrats), avg(TotalFibres), avg(TotalProteins), avg(TotalSalt), avg(TotalSugars)
FROM facts_dailysnapshot2
GROUP by User_IdUser;
