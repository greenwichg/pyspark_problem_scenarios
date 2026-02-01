-- models/viewed_videos.sql

WITH filtered_videos AS (
    SELECT
        duration,
        genre,
        release_year,
        title,
        video_id,
        view_count
    FROM {{ ref('video_stream') }}
    WHERE 
        view_count > 1000000
        AND release_year >= EXTRACT(YEAR FROM CURRENT_DATE) - 6
)

SELECT *
FROM filtered_videos
ORDER BY duration
