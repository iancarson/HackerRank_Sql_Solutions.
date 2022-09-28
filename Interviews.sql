/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select con.contest_id, hacker_id, name,
       ts, tas, tv, tuv
from contests con
inner join (
    select contest_id,
           sum(ts) ts, sum(tas) tas,
           sum(tv) tv, sum(tuv) tuv
    from colleges col
    inner join (
        select college_id,
               sum(ts) ts, sum(tas) tas,
               sum(tv) tv, sum(tuv) tuv
        from challenges ch
        inner join (
            select coalesce(v.challenge_id, s.challenge_id) challenge_id,
                   ts, tas, tv, tuv
            from ((
                select challenge_id,
                       sum(total_views) tv,
                       sum(total_unique_views) tuv
                from view_stats
                group by challenge_id) v
                full join (
                select challenge_id,
                       sum(total_submissions) ts,
                       sum(total_accepted_submissions) tas
                from submission_stats
                group by challenge_id) s
                on v.challenge_id = s.challenge_id)
            ) vs
        on ch.challenge_id = vs.challenge_id
        group by college_id) cvs
    on col.college_id = cvs.college_id
    group by col.contest_id) sub
on con.contest_id = sub.contest_id
where ts + tas + tv + tuv > 0
order by con.contest_id;
