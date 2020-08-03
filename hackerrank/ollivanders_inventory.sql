-- https://www.hackerrank.com/challenges/harry-potter-and-wands/problem

-- Solution using uncorrelated subquery.
select
    w.id,
    w.age,
    w.min_coins_needed as coins_needed,
    w.power
from (
	select
		w.id,
		wp.age,
		w.power,
		w.coins_needed,
		min(w.coins_needed) over (partition by wp.age, w.power) min_coins_needed
	from
		Wands w
	inner join
		Wands_Property wp
	on
		w.code = wp.code
    where
		wp.is_evil = 0
) w
where
    w.coins_needed = w.min_coins_needed
order by
    w.power desc,
    w.age desc;

-- Another solution using a correlated subquery.
select
	w.id,
	wp.age,
	w.coins_needed,
	w.power
from
	Wands w
inner join
	Wands_Property wp
on
    w.code = wp.code
where
	wp.is_evil = 0 and
	w.coins_needed = (
		select
			min(a.coins_needed)
		from
			Wands a
		where
			a.code = wp.code and
			a.power = w.power
	)
order by
	w.power desc,
	wp.age desc;

-- Another solution using an uncorrelated subquery and row_number window function.
select
    w.id,
    w.age,
    w.coins_needed,
    w.power
from (
	select
		w.id,
		wp.age,
		w.power,
		w.coins_needed,
		row_number() over (partition by wp.age, w.power order by w.coins_needed asc) as rn
	from
		Wands w
	inner join
		Wands_Property wp
	on
		w.code = wp.code
    where
		wp.is_evil = 0
) w
where
    w.rn = 1
order by
    w.power desc,
    w.age desc;

-- Another solution using multiple joins.
-- This assumes (code,power,coins_needed) tuples are unique.
select
    w.id,
    wp.age,
    w.coins_needed,
    w.power
from (
    select
        code,
        power,
        min(coins_needed) as coins_needed
    from
        Wands
    group by
        code,
        power
) i
inner join
    Wands_Property wp
on
    wp.code = i.code
inner join
    Wands w
on
    w.code = i.code and
    w.power = i.power and
    w.coins_needed = i.coins_needed
where
    wp.is_evil = 0
order by
    w.power desc,
    wp.age desc;
