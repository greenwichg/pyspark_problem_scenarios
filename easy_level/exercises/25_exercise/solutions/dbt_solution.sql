WITH base AS (
    SELECT
        cdate,
        user_type,
        downloads
    FROM {{ ref('adtc_customer') }}
),

aggregated AS (
    SELECT
        cdate,
        SUM(CASE WHEN user_type = 'free' THEN downloads ELSE 0 END) AS non_paying_downloads,
        SUM(CASE WHEN user_type = 'premium' THEN downloads ELSE 0 END) AS paying_downloads
    FROM base
    GROUP BY cdate
),

filtered AS (
    SELECT *
    FROM aggregated
    WHERE non_paying_downloads > paying_downloads
)

SELECT *
FROM filtered
ORDER BY cdate