select t.hacker_id,
        h.name,
        sum(t.score)
from(
select hacker_id,
        challenge_id,
        max(score) as score
from Submissions
group by hacker_id, challenge_id
) t
join Hackers h on h.hacker_id = t.hacker_id
group by t.hacker_id, h.name
having sum(t.score) != 0
order by 3 DESC, 1 ASC
