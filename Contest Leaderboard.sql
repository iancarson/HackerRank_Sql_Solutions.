/*
Enter your query here.
*/
select * from (select hacker_id, name, sum(score) as 
score from (select a.hacker_id, a.name, b.challenge_id,max(b.score) as score from hackers
a left join submissions b on a.hacker_id = b.hacker_id group by 1,2,3) a group by 1,2 order by score desc, 
hacker_id) b where score > 0
