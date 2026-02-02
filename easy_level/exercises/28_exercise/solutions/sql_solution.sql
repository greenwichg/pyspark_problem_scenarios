WITH event_counts AS (
    SELECT 
        app_id,
        COUNT(CASE WHEN event_type = 'click' THEN 1 END) AS clicks,
        COUNT(CASE WHEN event_type = 'impression' THEN 1 END) AS impressions
    FROM 
        cr_events
    WHERE 
        EXTRACT(YEAR FROM timestamp::timestamp) = 2022
    GROUP BY 
        app_id
)
SELECT 
    app_id,
    ROUND(100.0 * clicks::decimal / NULLIF(impressions, 0), 2) AS ctr
FROM 
    event_counts;
