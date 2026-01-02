SELECT *
FROM (
SELECT user_id,
        ROUND(AVG(CASE WHEN activity_type = 'free_trial' THEN activity_duration END),2) AS trial_avg_duration,
        ROUND(AVG(CASE WHEN activity_type = 'paid' THEN activity_duration END),2) AS paid_avg_duration
FROM UserActivity
GROUP BY user_id
ORDER BY 1
) a
WHERE a.trial_avg_duration IS NOT NULL
AND a.paid_avg_duration IS NOT NULL
