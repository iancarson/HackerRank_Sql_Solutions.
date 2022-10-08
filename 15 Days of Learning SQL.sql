select submission_date,
       (select count(distinct hacker_id)
        from submissions s2
        where submission_date = s1.submission_date and
              (select count(distinct submission_date)
               from submissions
               where hacker_id = s2.hacker_id and
                     submission_date < s1.submission_date
              ) = datediff(s1.submission_date, '2016-03-01')
       ),
       (select hacker_id
        from submissions
        where submission_date = s1.submission_date
        group by hacker_id
        order by count(hacker_id) desc, hacker_id
        limit 1
       ) h,
       (select name from hackers
        where hacker_id = h
       )
from (
    select distinct submission_date
    from submissions
) s1
order by submission_date;
