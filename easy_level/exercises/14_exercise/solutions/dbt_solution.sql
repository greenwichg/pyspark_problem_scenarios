WITH filtered_skills AS (
    SELECT 
        candidate_id, 
        skill
    FROM {{ ref('csm_candidate_skills') }} 
    WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
),

skill_counts AS (
    SELECT 
        candidate_id, 
        COUNT(DISTINCT skill) AS skill_count
    FROM filtered_skills
    GROUP BY candidate_id
)

SELECT candidate_id
FROM skill_counts
WHERE skill_count = 3
ORDER BY candidate_id;
