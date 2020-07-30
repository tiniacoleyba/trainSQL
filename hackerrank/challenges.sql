-- https://www.hackerrank.com/challenges/challenges/problem

-- Oracle
with d as (
    select
        h.hacker_id,
        h.name,
        count(*) as created
    from
        hackers h
    inner join
        challenges c
    on
        h.hacker_id = c.hacker_id
    group by
        h.hacker_id,
        h.name
)
select
    d.hacker_id,
    d.name,
    created
from
    d
where
    not (created < (select max(created) from d) and created in
         (select created from d group by created having count(*) > 1))
order by
    created desc,
    hacker_id;
