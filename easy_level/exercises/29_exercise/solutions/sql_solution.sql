WITH query_count AS (
    SELECT 
        q.employee_id,
        COUNT(DISTINCT q.query_id) AS unique_queries
    FROM 
        qd_queries q
    WHERE 
        q.query_starttime::DATE >= '2023-07-01' 
        AND q.query_starttime::DATE <= '2023-09-30'
    GROUP BY 
        q.employee_id
),
all_employees AS (
    SELECT 
        e.employee_id, 
        COALESCE(qc.unique_queries, 0) AS unique_queries
    FROM 
        qd_employees e
    LEFT JOIN 
        query_count qc 
    ON 
        e.employee_id = qc.employee_id
),
histogram AS (
    SELECT 
        unique_queries,
        COUNT(*) AS employee_count
    FROM 
        all_employees
    GROUP BY 
        unique_queries
    ORDER BY 
        unique_queries
)
SELECT * FROM histogram;
