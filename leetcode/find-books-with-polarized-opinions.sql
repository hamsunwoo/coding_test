SELECT book_id,
        title,
        author,
        genre,
        pages,
        rating_spread,
        polarization_score
FROM (
SELECT  r.book_id,
        b.title,
        b.author,
        b.genre,
        b.pages,
        MAX(r.session_rating) - MIN(r.session_rating) AS rating_spread,
        ROUND(SUM(CASE WHEN r.session_rating != 3 THEN 1 ELSE 0 END) / COUNT(r.session_rating), 2) AS polarization_score
FROM reading_sessions r 
JOIN books b ON r.book_id = b.book_id
GROUP BY r.book_id
HAVING MAX(r.session_rating) >= 4 AND MIN(r.session_rating) <= 2 AND COUNT(r.session_id) >= 5 
) t1
WHERE polarization_score >= 0.6
ORDER BY polarization_score DESC, title DESC
