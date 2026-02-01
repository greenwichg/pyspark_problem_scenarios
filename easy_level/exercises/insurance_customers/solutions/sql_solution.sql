SELECT customer_id, first_name, last_name, age, policy_type
FROM (
    SELECT * FROM ic_data_1
    UNION ALL
    SELECT * FROM ic_data_2
) combined_data
ORDER BY age;
