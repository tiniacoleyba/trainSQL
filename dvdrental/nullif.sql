-- nullif and its equivalence to a case-when
select
    nullif(1,1),
    case when 1 = 1 then null else 1 end,
    nullif('A','B'),
    case when 'A' = 'B' then null else 'A' end,
    nullif(2,3),
    case when 2 = 3 then null else 2 end;

-- nullif to avoid division-by-zero error
select
    1/nullif(0,0);
