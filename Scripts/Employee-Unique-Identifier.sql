SELECT 
    unique_id,
    name
FROM employees AS e
LEFT JOIN EmployeeUNI AS u
    ON e.id = u.id 