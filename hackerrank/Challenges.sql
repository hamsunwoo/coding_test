WITH challenge_counts AS (
    SELECT 
        hacker_id,
        COUNT(challenge_id) AS cnt
    FROM Challenges
    GROUP BY hacker_id
),
ranked AS (
    SELECT 
        hacker_id,
        cnt,
        LAG(cnt) OVER (ORDER BY cnt DESC) AS lag_t,
        LEAD(cnt) OVER (ORDER BY cnt DESC) AS lead_t
    FROM challenge_counts
),
tmp AS (
SELECT hacker_id, cnt
FROM ranked
WHERE (cnt <> lag_t OR lag_t IS NULL)
  AND (cnt <> lead_t OR lead_t IS NULL)

UNION

SELECT hacker_id, cnt
FROM challenge_counts
WHERE cnt = (SELECT MAX(cnt) FROM challenge_counts)
)
SELECT t.hacker_id, h.name, t.cnt
FROM tmp t
JOIN Hackers h ON t.hacker_id = h.hacker_id
ORDER BY cnt DESC, t.hacker_id ASC

