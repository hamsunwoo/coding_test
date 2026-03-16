SELECT tmp.user_id,
        tmp.reaction AS dominant_reaction,
        ROUND(tmp.counts / tmp.running_sum_cnt, 2) AS reaction_ratio
FROM (
SELECT  user_id,
        reaction,
        COUNT(*) AS counts,
        SUM(COUNT(*)) OVER (PARTITION BY user_id) AS running_sum_cnt
FROM reactions
GROUP BY 1, 2
) tmp
WHERE (tmp.counts / tmp.running_sum_cnt) >= 0.6
AND running_sum_cnt > 4
ORDER BY reaction_ratio DESC, tmp.user_id ASC
