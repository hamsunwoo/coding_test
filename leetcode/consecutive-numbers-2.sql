SELECT DISTINCT num AS ConsecutiveNums
FROM (
SELECT num,
    lead(num,1) over() num1,
    lead(num,2) over() num2
FROM Logs
) tmp
WHERE tmp.num = tmp.num1 AND tmp.num = tmp.num2
