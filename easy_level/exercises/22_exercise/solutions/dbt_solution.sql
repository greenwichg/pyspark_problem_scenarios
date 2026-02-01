-- models/duplicate_companies.sql

WITH duplicates AS (
    SELECT 
        company_id, 
        title, 
        description, 
        COUNT(*) AS listing_count
    FROM 
        {{ ref('rjp_listings') }}
    GROUP BY 
        company_id, title, description
    HAVING 
        COUNT(*) > 1
)

SELECT 
    COUNT(DISTINCT company_id) AS duplicate_companies
FROM 
    duplicates
