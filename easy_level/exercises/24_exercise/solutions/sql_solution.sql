SELECT 
    e.employee_id, 
    e.name AS employee_name
FROM 
    hea_employee e
JOIN 
    hea_employee m
ON 
    e.manager_id = m.employee_id
WHERE 
    e.salary > m.salary;
