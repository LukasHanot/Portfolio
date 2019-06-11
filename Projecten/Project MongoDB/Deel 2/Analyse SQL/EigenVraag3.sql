/*
Hoeveel nieuwe gebruikers zijn er bij gekomen in de laatste week?
*/

SELECT count(*) "Aantal nieuwe gebruikers laatste week"
FROM dim_user
WHERE date_FROM > (now() - interval 7 day);

