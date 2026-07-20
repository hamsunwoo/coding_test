# Write your MySQL query statement below
SELECT c.customer_id
FROM Customer c
GROUP bY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(*) FROM Product)


