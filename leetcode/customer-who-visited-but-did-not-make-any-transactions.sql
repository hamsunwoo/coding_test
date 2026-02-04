SELECT v.customer_id,
        SUM(CASE WHEN t.visit_id IS NULL THEN 1 END) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id
