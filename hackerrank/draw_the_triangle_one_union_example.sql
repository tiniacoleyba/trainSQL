-- https://www.hackerrank.com/challenges/draw-the-triangle-1/problem

-- MySQL
select
    lpad('',n.n*2,'* ')
from (
    select
        ones.n + tens.n*10 as n
    from
        (select 1 as n union select 2 union select 3 union
		 select 4 union select 5 union select 6 union select 7 union
		 select 8 union select 9 union select 10) ones
    inner join
        (select 0 as n union select 1) tens
    on
        true
    order by
        n desc
) n;

-- Oracle
with numbers as (
    select
        a.n
    from
        (select 1 n from dual union
         select 2 n from dual union
         select 3 n from dual union
         select 4 n from dual union
         select 5 n from dual union
         select 6 n from dual union
         select 7 n from dual union
         select 8 n from dual union
         select 9 n from dual union
         select 10 n from dual) a
)
select
    lpad(' ',(ones.n + 10*(tens.n-1))*2,'* ')
from
    numbers ones
left join
    numbers tens
on
    tens.n in (1,2)
order by
    (ones.n + 10*(tens.n-1)) desc;
