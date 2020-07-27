-- https://www.hackerrank.com/challenges/the-report/problem

-- Oracle
select
    case when g.grade < 8 then null else s.name end as name,
    g.grade,
    s.marks
from
    students s
inner join
    grades g
on
    s.marks between g.min_mark and g.max_mark
order by
    g.grade desc,
    case when g.grade < 8 then 'a' else s.name end;
