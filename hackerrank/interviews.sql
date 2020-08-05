-- https://www.hackerrank.com/challenges/interviews/problem

-- Oracle.
select
    c.contest_id,
    c.hacker_id,
    c.name,
    sum(st.total_submissions),
    sum(st.total_accepted_submissions),
    sum(vs.total_views),
    sum(vs.total_unique_views)
from
    contests c
inner join
    colleges co
on
    c.contest_id = co.contest_id
inner join
    challenges ch
on
    co.college_id = ch.college_id
left join (
    select
        challenge_id,
        sum(total_views) as total_views,
        sum(total_unique_views) as total_unique_views
    from
        view_stats
    group by
        challenge_id
) vs
on
    ch.challenge_id = vs.challenge_id
left join (
    select
        challenge_id,
        sum(total_submissions) as total_submissions,
        sum(total_accepted_submissions) as total_accepted_submissions
    from
        submission_stats
    group by
        challenge_id
) st
on
    ch.challenge_id = st.challenge_id
group by
    c.contest_id,
    c.hacker_id,
    c.name
order by
    contest_id;
