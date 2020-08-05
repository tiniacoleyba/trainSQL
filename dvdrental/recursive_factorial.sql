-- https://mariadb.com/kb/en/recursive-common-table-expressions-overview/
-- https://www.essentialsql.com/recursive-ctes-explained/

with recursive f (n,fact) as (
	select 1,1
	union all
	select
		n+1,fact*(n+1)
	from
		f
	where
		n < 10
)
select
	n,
	fact
from
	f;
