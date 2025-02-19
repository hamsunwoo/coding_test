SELECT m.name AS MEMBER_NAME,
        REVIEW_TEXT	,
        DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
        
FROM REST_REVIEW
JOIN
(
SELECT MEMBER_ID id,
        COUNT(MEMBER_ID) cnt
FROM REST_REVIEW
GROUP BY MEMBER_ID
HAVING cnt = (SELECT MAX(c.ccnt) FROM(
                                    SELECT COUNT(MEMBER_ID) ccnt
                                    FROM REST_REVIEW
                                    GROUP BY MEMBER_ID) c)) cc on MEMBER_ID = cc.id
JOIN(SELECT MEMBER_ID AS mid, MEMBER_NAME AS name
    FROM MEMBER_PROFILE) m on MEMBER_ID = m.mid
ORDER BY REVIEW_DATE asc,
        REVIEW_TEXT asc;
