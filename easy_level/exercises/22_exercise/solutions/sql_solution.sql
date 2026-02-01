SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM (
    SELECT company_id, title, description, COUNT(*) AS listing_count
    FROM rjp_listings
    GROUP BY company_id, title, description
    HAVING COUNT(*) > 1
) AS duplicates;
