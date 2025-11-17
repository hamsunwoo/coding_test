SELECT s.Name
FROM Students s
JOIN Packages p ON s.ID = p.ID
JOIN Friends f ON s.ID = f.ID
JOIN (
    SELECT f2.ID AS ID,
        p2.Salary AS Friend_salary
FROM Friends f2 
JOIN Packages p2 ON f2.Friend_ID = p2.ID
) tmp ON tmp.ID = s.ID
WHERE Salary < tmp.Friend_salary
ORDER BY tmp.Friend_salary ASC

