-- https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem

-- Oracle, MySQL.
select
    avg(population)
from
    city
where
    district = 'California';
