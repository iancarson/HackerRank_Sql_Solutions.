/*
Enter your query here.
*/
SELECT s.hacker_id, h.name
FROM hackers h
JOIN submissions s USING (hacker_id)
JOIN challenges c USING (challenge_id)
JOIN difficulty d USING (difficulty_level)
WHERE s.score = d.score
GROUP BY s.hacker_id, h.name
HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ASC
