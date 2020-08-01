-- https://www.hackerrank.com/challenges/contest-leaderboard/problem

-- Oracle. Solution using row_number analytic function.
select
    i.hacker_id,
    h.name,
    sum(i.score)
from (
    select
        hacker_id,
        challenge_id,
        score,
        row_number() over(partition by hacker_id, challenge_id order by score desc) as rn
    from
        submissions s
) i
inner join
    hackers h
on
    i.hacker_id = h.hacker_id
where
    i.rn = 1
group by
    i.hacker_id,
    h.name
having
    sum(i.score) > 0
order by
    sum(i.score) desc,
    i.hacker_id;

-- MySQL. Solution using group by.
select
    i.hacker_id,
    h.name,
    sum(i.max_score)
from (
    select
        hacker_id,
        challenge_id,
        max(score) as max_score
    from
        submissions s
    group by
        hacker_id,
        challenge_id
) i
inner join
    hackers h
on
    i.hacker_id = h.hacker_id
group by
    i.hacker_id,
    h.name
having
    sum(i.max_score) > 0
order by
    sum(i.max_score) desc,
    i.hacker_id;
