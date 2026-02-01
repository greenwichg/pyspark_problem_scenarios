-- models/employees_with_higher_salary_than_manager.sql

WITH employee_data AS (
    SELECT 
        employee_id, 
        name, 
        manager_id, 
        salary
    FROM 
        {{ ref('hea_employee') }}
)

SELECT 
    e.employee_id,
    e.name AS employee_name
FROM 
    employee_data e
JOIN 
    employee_data m
ON 
    e.manager_id = m.employee_id
WHERE 
    e.salary > m.salary
