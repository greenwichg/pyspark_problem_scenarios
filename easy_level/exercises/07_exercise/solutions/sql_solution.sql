WITH pay_calculation AS (
    SELECT 
        e.employee_id,
        e.name,
        e.position,
        p.hours_worked,
        p.hourly_rate,
        CASE 
            WHEN p.hours_worked <= 40 THEN p.hours_worked * p.hourly_rate
            ELSE (40 * p.hourly_rate) + ((p.hours_worked - 40) * (p.hourly_rate * 1.5))
        END AS pay
    FROM rp_employees e
    JOIN rp_payroll p ON e.employee_id = p.employee_id
)
SELECT 
    employee_id,
    name,
    ROUND(pay::numeric, 2) AS pay,
    position
FROM pay_calculation
ORDER BY employee_id;