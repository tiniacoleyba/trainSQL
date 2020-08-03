-- https://www.hackerrank.com/challenges/salary-of-employees/problem

-- MySQL
select
    name
from
    employee
where
    salary > 2000 and
    months < 10;
