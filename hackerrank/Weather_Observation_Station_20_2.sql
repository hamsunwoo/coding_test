select ROUND(LAT_N, 4)
from (
    SELECT LAT_N,
            PERCENT_RANK() OVER (ORDER BY LAT_N) percent
    FROM STATION
) tmp
WHERE tmp.percent = 0.5;
