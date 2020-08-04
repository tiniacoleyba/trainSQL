with recursive f (n1,n2) as (
	select 1,1
	union all
	select
		n2,
		n1+n2
	from
		f
	where
        n2 < 1000
)
select
	n1
from
	f;
