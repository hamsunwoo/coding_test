SELECT DISTINCT tmp.user_id,
                tmp.user_cnt AS prompt_count,
                ROUND(tmp.avg_tokens, 2) AS avg_tokens
FROM prompts p
JOIN ( 
SELECT user_id,
        COUNT(user_id) AS user_cnt,
        AVG(tokens) AS avg_tokens
FROM prompts
GROUP BY user_id
) tmp ON p.user_id = tmp.user_id
WHERE tmp.user_cnt >= 3
AND p.tokens > tmp.avg_tokens 
ORDER BY tmp.avg_tokens DESC,tmp.user_id ASC
