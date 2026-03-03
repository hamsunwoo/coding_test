SELECT p1.product_id product1_id,
        p2.product_id product2_id,
        pi1.category product1_category,
        pi2.category product2_category,
        count(1) customer_count
FROM ProductPurchases p1
JOIN ProductPurchases p2 ON p1.user_id = p2.user_id
AND p1.product_id <> p2.product_id
JOIN ProductInfo pi1 ON p1.product_id = pi1.product_id
JOIN ProductInfo pi2 ON p2.product_id = pi2.product_id
WHERE p1.product_id < p2.product_id
GROUP BY p1.product_id, p2.product_id, pi1.category, pi2.category
HAVING count(1) >= 3
ORDER BY customer_count DESC, p1.product_id, p2.product_id;
