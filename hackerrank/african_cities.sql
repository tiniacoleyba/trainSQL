-- https://www.hackerrank.com/challenges/african-cities/problem

-- Oracle
select
    city.name
from
    city
left join
    country
on
    city.CountryCode = country.Code
where
    continent = 'Africa';
