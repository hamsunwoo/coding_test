WITH cnt AS (
    SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS cnt
    FROM Hackers h
    JOIN Challenges c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
),
max_cnt AS (
    SELECT MAX(cnt) AS max_cnt
    FROM cnt
),
cnt_frequency AS(
    SELECT cnt, COUNT(*) AS freq
    FROM cnt
    GROUP BY cnt
)
SELECT c.hacker_id, c.name, c.cnt
FROM cnt c
JOIN cnt_frequency cf ON c.cnt = cf.cnt
WHERE cf.freq = 1 OR c.cnt = (SELECT max_cnt FROM max_cnt)
ORDER BY c.cnt DESC, c.hacker_id;
