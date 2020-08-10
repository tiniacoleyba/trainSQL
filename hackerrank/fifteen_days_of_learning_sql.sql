-- https://www.hackerrank.com/domains/sql?filters%5Bstatus%5D%5B%5D=unsolved&badge_type=sql

-- Oracle.
with s (submission_date, hacker_id, submission_id) as (
    select
        submission_date,
        hacker_id,
        submission_id
    from
        submissions
    where
       submission_date = (select min(submission_date) from submissions) and
       submission_id is not null
    union all
    select
        s2.submission_date,
        s2.hacker_id,
        s2.submission_id
    from
        submissions s2
    inner join
        s
    on
        s2.submission_date = (s.submission_date + 1) and
        s2.hacker_id = s.hacker_id and
        s2.submission_id is not null
), s2 as (
    select
        submission_date,
        hacker_id,
        count(submission_id) as total_submissions
    from
        submissions
    group by
        submission_date,
        hacker_id
), s3 as (
    select
        s3.submission_date,
        (select count(distinct s.hacker_id)
         from s
         where s3.submission_date = s.submission_date
        ) as num_hackers,
        (select min(s2.hacker_id)
         from s2
         where s2.submission_date = s3.submission_date and
         total_submissions = (
             select max(total_submissions)
             from s2
             where s2.submission_date = s3.submission_date)
        ) as hacker_id
    from
        (select distinct submission_date from submissions) s3
)
select
    s3.submission_date,
    s3.num_hackers,
    s3.hacker_id,
    h.name
from
    s3
inner join
    hackers h
on
    s3.hacker_id = h.hacker_id
order by
    s3.submission_date;
