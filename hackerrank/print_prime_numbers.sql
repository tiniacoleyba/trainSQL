-- https://www.hackerrank.com/challenges/print-prime-numbers/problem


-- Oracle
with lines (n) as (
    select 1 from dual
    union all
    select 1 from dual
    union all
    select 1 from dual
    union all
    select 1 from dual
    union all
    select 1 from dual
), numbers as (
    select
        row_number() over(order by l1.n) as n
    from
        lines l1, lines l2, lines l3, lines l4, lines l5
)
select
    listagg(n.n,'&') within group (order by n.n)
from
    numbers n
where
    n.n between 2 and 1000 and
    not exists(
        select
            n
        from
            numbers
        where
            mod(n.n,n) = 0 and
            n.n > n and
            n > 1
    );
