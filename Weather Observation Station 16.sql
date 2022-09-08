/*
Enter your query here.
*/
SELECT ROUND(MIN(LAT_N),4)
FROM Station
WHERE LAT_N > 38.7880;
