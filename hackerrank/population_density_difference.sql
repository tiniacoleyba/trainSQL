-- https://www.hackerrank.com/challenges/population-density-difference/problem

-- Oracle, MySQL.
select
    max(population) - min(population)
from
    city;
