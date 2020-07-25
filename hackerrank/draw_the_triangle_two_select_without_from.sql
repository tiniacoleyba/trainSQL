-- https://www.hackerrank.com/challenges/draw-the-triangle-2/problem

-- MySQL
select
    repeat('* ', ones.n + 10*tens.n)
from
   (select 1 as n union
    select 2 as n union
    select 3 as n union
    select 4 as n union
    select 5 as n union
    select 6 as n union
    select 7 as n union
    select 8 as n union
    select 9 as n union
    select 10 as n) ones,
   (select 0 as n union
    select 1 as n) tens
order by
   ones.n + 10*tens.n asc;
