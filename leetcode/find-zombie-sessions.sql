SELECT t1.session AS session_id,
        t1.id AS user_id, 
        t1.diff AS session_duration_minutes,
        SUM(CASE WHEN event_type = 'scroll' THEN 1 ELSE 0 END) AS scroll_count
FROM app_events
JOIN (
SELECT user_id AS id,
        session_id AS session,
        round(timestampdiff(minute,min(event_timestamp),max(event_timestamp))) AS diff
FROM app_events 
GROUP BY user_id, session_id
HAVING round(timestampdiff(minute,min(event_timestamp),max(event_timestamp))) >= 30
) t1 ON t1.id = user_id AND t1.session = session_id
GROUP BY t1.id, t1.session
HAVING SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) / SUM(CASE WHEN event_type = 'scroll' THEN 1 ELSE 0 END) < 0.20
AND SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) = 0
AND SUM(CASE WHEN event_type = 'scroll' THEN 1 ELSE 0 END) >= 5
ORDER BY scroll_count DESC, t1.session ASC
;
