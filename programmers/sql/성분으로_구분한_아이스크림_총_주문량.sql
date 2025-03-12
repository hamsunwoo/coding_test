SELECT i.INGREDIENT_TYPE, 
        SUM(f.TOTAL_ORDER) AS TOTAL_ORDER
FROM FIRST_HALF f
LEFT JOIN ICECREAM_INFO i on f.FLAVOR = i.FLAVOR
GROUP BY i.INGREDIENT_TYPE
ORDER BY TOTAL_ORDER ASC;
