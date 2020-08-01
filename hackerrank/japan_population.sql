-- https://www.hackerrank.com/challenges/japan-population/problem

-- Oracle, MySQL.
select
    sum(population)
from
    city
where
    countrycode = 'JPN';
