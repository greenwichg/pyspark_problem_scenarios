WITH monthly_reviews AS (
    SELECT 
        EXTRACT(MONTH FROM CAST(submit_date AS DATE)) AS mth,  -- Convert VARCHAR to DATE
        product_id AS product,
        ROUND(AVG(stars), 2) AS avg_stars
    FROM {{ ref('mr_reviews') }}
    GROUP BY mth, product
)

SELECT * FROM monthly_reviews
ORDER BY mth, product;
