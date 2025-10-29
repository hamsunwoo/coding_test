select t.hacker_id,
        t.name,
        sum(t.score)
from(
select s.hacker_id,
        h.name,
        challenge_id,
        max(score) as score
from Submissions s
join Hackers h on h.hacker_id = s.hacker_id
group by s.hacker_id, h.name, challenge_id
) t
group by t.hacker_id, t.name
having sum(t.score) != 0
order by 3 DESC, 1 ASC
