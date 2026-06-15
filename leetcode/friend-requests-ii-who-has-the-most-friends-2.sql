SELECT tmp.requester_id AS id,
        COUNT(tmp.requester_id) AS num
FROM (
SELECT requester_id
FROM RequestAccepted

UNION ALL

SELECT accepter_id
FROM RequestAccepted
) tmp
GROUP BY tmp.requester_id
ORDER BY 2 DESC
LIMIT 1
