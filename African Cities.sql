SELECT C1.NAME FROM CITY C1
JOIN COUNTRY C2 ON C1.COUNTRYCODE = C2.CODE
WHERE C2.CONTINENT LIKE 'AFRICA';
