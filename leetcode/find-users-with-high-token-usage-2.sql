SELECT user_id,
        COUNT(*) AS prompt_count,
        ROUND(AVG(tokens),2) AS avg_tokens
FROM prompts
GROUP BY user_id
HAVING COUNT(*) > 2 AND MAX(tokens) > AVG(tokens)
ORDER BY 3 DESC, 1 ASC
