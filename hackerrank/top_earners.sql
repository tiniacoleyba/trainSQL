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
