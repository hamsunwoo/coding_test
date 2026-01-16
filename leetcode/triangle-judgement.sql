SELECT *,
        CASE WHEN x + y > z and x + z > y AND y + z > x THEN 'Yes' ELSE 'No' END AS triangle
FROM Triangle
