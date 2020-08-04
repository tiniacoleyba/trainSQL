-- https://www.hackerrank.com/challenges/sql-projects/problem

-- Oracle.
with p (start_date, end_date, days) as (
    select
        start_date,
        end_date,
        end_date - start_date
    from
        projects
    union all
    select
        p.start_date,
        p2.end_date,
        p2.end_date - p.start_date
    from
        p
    inner join
        projects p2
    on
        p.end_date = p2.start_date
)
select
    start_date,
    max(end_date)
from
    p
where
    start_date not in (select end_date from p)
group by
    start_date
order by
    max(days),
    start_date;
