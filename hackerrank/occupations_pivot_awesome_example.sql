-- https://www.hackerrank.com/challenges/occupations/problem
-- Oracle

-- Solution 1: multiple joins
with o as (
    select
        name,
        occupation,
        row_number() over(partition by occupation order by name) as rn
    from
        occupations
)
select
    od.name,
    op.name,
    os.name,
    oa.name
from
    (select distinct rn from o) orn
left join
    o od
on
    orn.rn = od.rn and
    od.occupation = 'Doctor'
left join
    o op
on
    orn.rn = op.rn and
    op.occupation = 'Professor'
left join
    o os
on
    orn.rn = os.rn and
    os.occupation = 'Singer'
left join
    o oa
on
    orn.rn = oa.rn and
    oa.occupation = 'Actor';

-- Solution 2: group by and decode
select
    min(decode(occupation,'Doctor',name)),
    min(decode(occupation,'Professor',name)),
    min(decode(occupation,'Singer',name)),
    min(decode(occupation,'Actor',name))
from
     (select
        name,
        occupation,
        row_number() over(partition by occupation order by name) as rn
      from
        occupations
     ) o
group by
    rn
order by
    rn;
