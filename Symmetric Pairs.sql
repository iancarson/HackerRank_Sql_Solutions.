with temp as
(
select
    x,
    y,
    row_number() over(order by x) as rn
from
    functions
)
select distinct
    t1.x,
    t1.y
from
    temp t1
join
    temp t2
on
   t1.x = t2.y
and
    t2.x = t1.y
and
    t1.rn <> t2.rn
and
    t1.x <= t1.y
order by
    t1.x
