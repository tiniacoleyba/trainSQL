-- https://www.hackerrank.com/challenges/revising-the-select-query-2/problem

select
    name
from
    city
where
    CountryCode = 'USA' and
    population > 120000;
