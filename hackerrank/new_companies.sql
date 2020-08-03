-- https://www.hackerrank.com/challenges/the-company/problem

-- Oracle, MySQL.
select
    e.company_code,
    c.founder,
    count(distinct e.lead_manager_code),
    count(distinct e.senior_manager_code),
    count(distinct e.manager_code),
    count(distinct e.employee_code)
from
    employee e
inner join
    company c
on
    e.company_code = c.company_code
group by
    e.company_code,
    c.founder
order by
    e.company_code asc;
