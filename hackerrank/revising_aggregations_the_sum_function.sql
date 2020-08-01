-- https://www.hackerrank.com/challenges/revising-aggregations-sum/problem

-- Oracle, MySQL.
select
    sum(population)
from
    city
where
    district = 'California';
