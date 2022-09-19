/*
Enter your query here.
*/
SELECT W.id, WP.age, W.coins_needed, W.power
FROM Wands AS W
JOIN Wands_Property AS WP
USING(code)
WHERE WP.is_evil = 0 AND 
W.coins_needed = (SELECT MIN(coins_needed) 
                    FROM Wands AS W2
                    JOIN Wands_Property AS WP2 
                    USING(code)
                    WHERE W2.power = W.power AND WP2.age = WP.age) 
ORDER BY W.power DESC, WP.age DESC;
