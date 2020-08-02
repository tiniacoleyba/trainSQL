-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem

-- MySQL
with pr as (
    select
        lat_n,
        percent_rank() over(order by lat_n) pr
    from
        station
)
select
    round(lat_n,4)
from
    pr
where
    pr.pr >= 0.5
order by
    pr
limit 1;
