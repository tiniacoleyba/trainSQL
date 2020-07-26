-- https://www.hackerrank.com/challenges/symmetric-pairs/problem

-- Oracle. First solution.
select
    f1.x,
    f1.y
from
    Functions f1
inner join
    Functions f2
on
    f1.x = f2.y and f1.y = f2.x
where
    f1.x <= f1.y
group by
    f1.x,
    f1.y
having
    not (f1.x = f1.y and count(*) = 1)
order by
    f1.x,
    f1.y;

-- Oracle. Second solution.
select
    x,
    y
from (
    select
        x,
        y,
        count(*) as num_matches
    from (
        select
            x,
            y
        from
            Functions
        where
            (y,x) in (select x,y from Functions)
    ) i
    group by
        x,
        y
    having
        not (x=y and count(*) = 1)
) o
where
    x <= y
order by
    x,
    y;
