/*
Hoeveel gebruikers zijn er per land?
*/
SELECT count(*) as "Aantallen", Country FROM dim_user
GROUP BY COUNTRY;