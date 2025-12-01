SELECT N,
        CASE WHEN P is null THEN 'Root'
            WHEN N in ((SELECT DISTINCT P FROM BST)) THEN 'Inner' ELSE 'Leaf' END
FROM BST 
ORDER BY 1;

