SELECT MIN(Doctor), MIN(Professor), MIN(Singer), MIN(Actor) FROM( SELECT row_number() over(PARTITION BY Occupation ORDER BY Name)
AS RowNumber, CASE WHEN Occupation='Doctor' THEN Name END AS Doctor, CASE WHEN Occupation='Professor' then Name END AS Professor, 
CASE WHEN Occupation='Singer' then Name END AS Singer, CASE WHEN Occupation='Actor' 
then Name END AS Actor FROM OCCUPATIONS ) Temp GROUP BY RowNumber;
