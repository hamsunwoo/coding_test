SELECT CASE WHEN g.grade < 8 THEN NULL ELSE s.name END AS Name
     , g.grade
     , s.marks
FROM Students s
     INNER JOIN Grades g ON s.marks Between g.min_mark and g.max_mark
ORDER BY g.grade DESC, s.name, s.marks
