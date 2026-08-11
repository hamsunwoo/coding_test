SELECT tmp2.product_id, IFNULL(tmp2.new_price,10) AS price
FROM (
SELECT p3.product_id, MAX(tmp.new_price) AS new_price
FROM Products p3
LEFT JOIN (
SELECT p1.product_id, p1.new_price
FROM Products p1
JOIN (
    SELECT product_id, MAX(change_date) AS change_date
    FROM Products 
    WHERE change_date <= '2019-08-16'
    GROUP BY 1
) p2
ON p1.product_id = p2.product_id AND p1.change_date = p2.change_date
) tmp 
ON p3.product_id = tmp.product_id AND p3.new_price = tmp.new_price
GROUP BY 1
) tmp2
