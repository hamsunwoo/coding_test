SELECT CONCAT(Name,'(',LEFT(Occupation, 1), ')')
FROM OCCUPATIONS
ORDER BY Name ASC;

SELECT CONCAT('There are a total of ', COUNT(Occupation),' ', Lower(Occupation),'s.')
FROM OCCUPATIONS 
GROUP BY Occupation
ORDER BY COUNT(Occupation) ASC;
