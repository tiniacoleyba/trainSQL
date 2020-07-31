-- https://www.hackerrank.com/challenges/average-population-of-each-continent/problem

-- MySQL
select
    continent,
    floor(avg(city.population))
from
    city
inner join
    country
on
    city.CountryCode = country.Code
group by
    continent;
