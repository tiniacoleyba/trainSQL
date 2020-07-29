-- https://www.hackerrank.com/challenges/weather-observation-station-11/problem

-- MySQL
select
    distinct city
from
    station
where
    city regexp "^[^aeiou].*" or
    city regexp ".*[^aeiou]$";
