SELECT customer_id
FROM customer_transactions
GROUP BY customer_id
HAVING COUNT(CASE WHEN transaction_type = 'refund' THEN customer_id END) / COUNT(customer_id) < 0.2
AND DATEDIFF(MAX(transaction_date), MIN(transaction_date)) >= 30
AND COUNT(customer_id) >= 3
