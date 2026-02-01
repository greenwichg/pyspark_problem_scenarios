WITH combined_data AS (
    SELECT customer_id, first_name, last_name, age, policy_type FROM {{ ref('ic_data_1') }}
    UNION ALL
    SELECT customer_id, first_name, last_name, age, policy_type FROM {{ ref('ic_data_2') }}
)

SELECT *
FROM combined_data
ORDER BY age
