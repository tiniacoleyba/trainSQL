-- https://www.hackerrank.com/challenges/placements/problem

-- Oracle, MySQL.
select
    s.name
from
    students s
inner join
    packages sals
on
    s.id = sals.id
inner join
    friends f
on
    s.id = f.id
inner join
    packages salf
on
    f.friend_id = salf.id
where
    salf.salary > sals.salary
order by
    salf.salary;
