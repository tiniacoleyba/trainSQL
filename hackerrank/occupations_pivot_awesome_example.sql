-- https://www.hackerrank.com/challenges/occupations/problem
-- Oracle
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
