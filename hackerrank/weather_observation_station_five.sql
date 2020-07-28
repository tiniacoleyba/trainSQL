-- https://www.hackerrank.com/challenges/weather-observation-station-5/problem

select
    min(city) city,
    length(city) len
from
    station
where
    length(city) = (select max(length(city)) from station) or
    length(city) = (select min(length(city)) from station)
group by
    length(city)
order by
    len,
    city;
