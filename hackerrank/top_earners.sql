-- https://www.hackerrank.com/challenges/earnings-of-employees/problem

-- Oracle.
select
    earnings,
    count(*)
from (
    select
        months*salary as earnings,
        max(months*salary) over() as max_earnings
    from
        employee
) i
where
    earnings = max_earnings
group by
    earnings;

-- MySQL
select
    salary*months,
    count(*)
from
    employee
group by
    salary*months
order by
    salary*months desc
limit 1;
