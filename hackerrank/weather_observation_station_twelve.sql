-- https://www.hackerrank.com/challenges/weather-observation-station-12/problem

-- MySQL
select
    distinct city
from
    station
where
    city regexp "^[^aeiou].*[^aeiou]$";
