SELECT GROUP_CONCAT(num_a SEPARATOR '&')
FROM(
    SELECT @num := @num+1 AS num_a
    FROM    information_schema.tables t1,
            information_schema.tables t2,
            (SELECT @num:=1) tmp
) Numtmp
WHERE num_a <= 1000
AND NOT EXISTS (
    SELECT *
    FROM(
        SELECT @nu := @nu+1 AS num_b
        FROM    information_schema.tables t1,
                information_schema.tables t2,
                (SELECT @nu:=1) tmp2
        LIMIT 1000
    ) Numtmp2
WHERE FLOOR(num_a/num_b) = (num_a/num_b)
AND num_b < num_a
AND 1 < num_b
)
