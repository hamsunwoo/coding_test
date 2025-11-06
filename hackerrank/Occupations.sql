SELECT MIN(CASE WHEN occupation = 'doctor' THEN name END)
        , MIN(CASE WHEN occupation = 'professor' THEN name END)
        , MIN(CASE WHEN occupation = 'singer' THEN name END)
        , MIN(CASE WHEN occupation = 'actor' THEN name END)
FROM (
    SELECT occupation
            , name
            , ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) as rn
    FROM occupations
    ORDER BY name
    ) as tmp
GROUP BY rn
