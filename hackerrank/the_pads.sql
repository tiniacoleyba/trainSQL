-- https://www.hackerrank.com/challenges/the-pads/problem

-- Oracle
select
    name
from (
    select
        name || '(' || substr(occupation,0,1) || ')' as name,
        0 as rn
    from
        occupations
    union all
    select
        'There are a total of ' || count(*) || ' ' || lower(occupation) || 's.' as name,
        1 as rn
    from
        occupations
    group by
        occupation
) o
order by
    rn,
    name;
