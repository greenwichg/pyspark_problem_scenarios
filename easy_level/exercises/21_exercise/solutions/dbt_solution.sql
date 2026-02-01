WITH message_counts AS (
    SELECT 
        sender_id,
        COUNT(*) AS message_count
    FROM 
        {{ ref('ttu_messages') }}
    WHERE 
        EXTRACT(YEAR FROM TO_TIMESTAMP(sent_date, 'YYYY-MM-DD HH24:MI:SS')) = 2022
        AND EXTRACT(MONTH FROM TO_TIMESTAMP(sent_date, 'YYYY-MM-DD HH24:MI:SS')) = 8
    GROUP BY 
        sender_id
)

SELECT 
    sender_id, 
    message_count
FROM 
    message_counts
ORDER BY 
    message_count DESC
LIMIT 2;
