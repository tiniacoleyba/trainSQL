-- https://www.hackerrank.com/challenges/full-score/problem

-- Oracle
select
    h.hacker_id,
    h.name
from
    submissions s
inner join
    challenges c
on
    s.challenge_id = c.challenge_id
inner join
    difficulty d
on
    c.difficulty_level = d.difficulty_level
inner join
    hackers h
on
    s.hacker_id = h.hacker_id
where
    s.score = d.score
group by
    h.hacker_id,
    h.name
having
    count(s.challenge_id) > 1
order by
    count(s.challenge_id) desc,
    h.hacker_id;
