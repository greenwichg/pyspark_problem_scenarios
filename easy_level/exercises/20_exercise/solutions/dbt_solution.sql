WITH filtered_posts AS (
    SELECT 
        user_id, 
        post_date::DATE AS post_date, 
        post_id
    FROM {{ ref('post_gap_posts') }}
    WHERE DATE_PART('year', post_date::DATE) = 2021
),
user_post_aggregates AS (
    SELECT 
        user_id,
        MAX(post_date) - MIN(post_date) AS days_between,
        COUNT(post_id) AS post_count
    FROM filtered_posts
    GROUP BY user_id
)
SELECT 
    user_id, 
    days_between
FROM user_post_aggregates
WHERE post_count > 1;
