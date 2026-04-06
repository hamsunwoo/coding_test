SELECT tmp.user_id,
        tmp.action,
        MAX(tmp.rnk) AS streak_length,
        MIN(tmp2.action_date) AS start_date,
        MAX(tmp.action_date) AS end_date
FROM (
SELECT *,
        ROW_NUMBER() OVER (PARTITION BY CONCAT(user_id,action) ORDER BY action_date) AS rnk
FROM activity
) tmp
JOIN (
    SELECT *
FROM activity
) tmp2 ON tmp.user_id = tmp2.user_id AND tmp.action = tmp2.action 
GROUP BY tmp.user_id, tmp.action
HAVING MAX(rnk) >= 5
ORDER BY streak_length DESC, tmp.user_id ASC
