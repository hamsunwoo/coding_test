# Write your MySQL query statement below
WITH buy_t AS (
    SELECT stock_name,
            SUM(price) AS price
    FROM Stocks
    WHERE operation = 'Buy'
    GROUP BY stock_name
),
sell_t AS (
    SELECT stock_name,
            SUM(price) AS price
    FROM Stocks
    WHERE operation = 'Sell'
    GROUP BY stock_name
)
SELECT stock_name,
        sell_t.price - buy_t.price AS capital_gain_loss
FROM sell_t
JOIN buy_t USING (stock_name)
