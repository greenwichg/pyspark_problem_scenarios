WITH uncompleted_parts AS (
    SELECT 
        component, 
        assembly_stage
    FROM {{ ref('ia_parts') }}  -- Use ref() if ia_parts is a DBT model
    WHERE completion_date IS NULL
)

SELECT * FROM uncompleted_parts;
