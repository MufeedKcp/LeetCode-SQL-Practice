SELECT 
    *
FROM (
SELECT 
    name,
    bonus
FROM Employee AS e
LEFT JOIN Bonus AS b
    ON  e.empId = b.empId
) AS t
WHERE bonus < 1000
OR bonus IS NULL
