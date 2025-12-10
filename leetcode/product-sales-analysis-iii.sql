SELECT s.product_id,
        s.year AS first_year,
        s.quantity,
        s.price
FROM Sales s
JOIN (
    SELECT product_id,
            MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) tmp ON s.product_id = tmp.product_id AND s.year = tmp.first_year
