SELECT CASE WHEN g.Grade >= 8 THEN s.Name 
            WHEN g.Grade < 8 THEN 'NULL'
        END AS name,
        g.Grade,
        s.Marks
FROM Students s
JOIN Grades g ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY g.Grade DESC, s.Name ASC;
