-- https://www.hackerrank.com/challenges/the-blunder/problem

-- Oracle.
select
    ceil(avg(salary) - avg(cast(replace(to_char(salary),'0','') as integer)))
from
    employees;
