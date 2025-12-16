SELECT tmp.book_id,
        tmp.title,
        tmp.author,
        tmp.genre,
        tmp.publication_year,
        tmp.current_borrowers
FROM (
SELECT b.book_id,
        l.title,
        l.author,
        l.genre,
        l.publication_year,
        COUNT(b.book_id) AS current_borrowers,
        l.total_copies
FROM borrowing_records b
JOIN library_books l ON b.book_id = l.book_id
WHERE b.return_date IS NULL
GROUP BY b.book_id,
        l.title,
        l.author,
        l.genre,
        l.publication_year
ORDER BY COUNT(b.book_id) DESC,
         l.title ASC
) tmp
WHERE tmp.current_borrowers = tmp.total_copies
