SELECT q.person_name
FROM Queue q
JOIN(
    SELECT turn,
        SUM(weight) OVER(ORDER BY turn) AS cumul_sum
FROM Queue
) a ON q.turn = a.turn
WHERE a.cumul_sum <= 1000
ORDER BY q.turn DESC
LIMIT 1

