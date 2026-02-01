WITH viewership AS (
    SELECT
        device_type
    FROM {{ source('your_source_schema', 'da_viewership') }}
)

SELECT
    COUNT(CASE WHEN device_type = 'laptop' THEN 1 END) AS laptop_views,
    COUNT(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 END) AS mobile_views
FROM viewership;
