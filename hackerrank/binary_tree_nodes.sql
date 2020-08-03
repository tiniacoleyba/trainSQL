-- https://www.hackerrank.com/challenges/binary-search-tree-1/problem

-- Oracle, MySQL.
select
    n,
    case
        when p is null then 'Root'
        when exists(select 1 from bst where p=b.n) then 'Inner'
        else 'Leaf'
    end
from
    bst b
order by
    n;
