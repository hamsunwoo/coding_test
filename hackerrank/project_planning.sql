SELECT  MIN(tmp.Start_Date),
        MAX(tmp.End_Date)
FROM(
SELECT Start_Date,
        End_Date,
        Start_Date - ROW_NUMBER() OVER(ORDER BY Start_Date) as rnk
FROM Projects
) tmp
GROUP BY tmp.rnk
ORDER BY DATEDIFF(MAX(tmp.End_Date), MIN(tmp.Start_Date)) ASC,
        MIN(tmp.Start_Date) ASC;
