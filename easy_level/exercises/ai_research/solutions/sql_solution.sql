-- Write query here
-- USE TABLE NAME `ai_research_papers` & `ai_author`
WITH numbered_authors AS (
    SELECT 
        a.author_id,
        a.name,
        a.paper_id,
        ROW_NUMBER() OVER (PARTITION BY a.paper_id ORDER BY a.author_id) AS row_number
    FROM 
        ai_author a
    JOIN 
        ai_research_papers rp ON a.paper_id = rp.paper_id
)
SELECT 
    author_id,
    name,
    paper_id,
    row_number::int
FROM 
    numbered_authors
ORDER BY 
    paper_id, row_number;