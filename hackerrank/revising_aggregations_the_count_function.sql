-- https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem

-- Oracle, MySQL.
select
    count(name)
from
    city
where
    population > 100000;
