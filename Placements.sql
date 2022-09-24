with A as (
    select p.id, p.salary
    from packages p, friends f
    where p.id = f.id
    ),
B as (
    select f.friend_id as id, p.salary
    from packages p, friends f
    where p.id = f.friend_id
)
select name
from A, B, friends, students
where A.id = friends.id
    and B.id = friends.friend_id
    and A.id = students.id
    and B.salary > A.salary
order by B.salary;
