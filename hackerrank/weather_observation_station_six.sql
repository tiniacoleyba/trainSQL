-- https://www.hackerrank.com/challenges/weather-observation-station-6/problem

-- MS SQL Server
select
    city
from
    station
where
    city like '[aeiou]%'
group by
    city;

-- MySQL
select
    distinct city
from
    station
where
    city regexp "^[aeiou].*";
