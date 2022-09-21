SELECT
    cc.hacker_id,
    cc.name,
    cc.nchallenge
FROM
    (SELECT -- challenge_count table
        h.hacker_id,
        h.name,
        COUNT(DISTINCT(c.challenge_id)) as nchallenge
    FROM
        Hackers h
    JOIN
        Challenges c
    USING (hacker_id)
    GROUP BY h.hacker_id, h.name) cc
WHERE cc.nchallenge IN
    (SELECT DISTINCT(cc1.nchallenge)
    FROM
        (SELECT -- challenge_count table again!
            h.hacker_id,
            h.name,
            COUNT(DISTINCT(c.challenge_id)) as nchallenge
        FROM
            Hackers h
        JOIN
            Challenges c
        USING (hacker_id)
        GROUP BY h.hacker_id, h.name) cc1
    GROUP BY cc1.nchallenge
    HAVING COUNT(*) = 1 OR cc1.nchallenge =
        (SELECT MAX(cc2.nchallenge) FROM
            (SELECT -- challenge_count table one more time!
                h.hacker_id,
                h.name,
                COUNT(DISTINCT(c.challenge_id)) as nchallenge
            FROM
                Hackers h
            JOIN
                Challenges c
            USING (hacker_id)
            GROUP BY h.hacker_id, h.name) cc2
        )
    )
ORDER BY cc.nchallenge DESC, cc.hacker_id;
