SELECT a.id,
        SUM(a.cnt) AS num
FROM (
SELECT requester_id AS id,
        COUNT(requester_id) AS cnt
FROM RequestAccepted
GROUP BY requester_id
UNION ALL
    SELECT accepter_id AS id,
        COUNT(accepter_id) AS cnt
    FROM RequestAccepted
    GROUP BY accepter_id
) a
GROUP BY a.id
ORDER BY SUM(a.cnt) DESC
LIMIT 1
