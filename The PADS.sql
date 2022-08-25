SELECT CONCAT(Name,"(",SUBSTR(Occupation,1,1),")")
FROM OCCUPATIONS
ORDER BY Name ASC;

SELECT CONCAT ('There are a total of ', COUNT(Occupation) ,' ',lower(Occupation),'s.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(Occupation) , Occupation ASC
