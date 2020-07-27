-- Coalesce: returns the first non-null value or null is there is none
select
    coalesce(null,null,1,2,3,4),
    coalesce(2,null,1,3,null),
    coalesce(null,null,null)
