-- Staging Model: Standardizes raw ONS wave survey metadata
WITH source AS (
    SELECT * FROM {{ source('raw_ons', 'dim_survey_waves') }}
)
SELECT
    CAST(wave_id AS INT) AS wave_id,
    CAST(publication_date AS DATE) AS publication_date,
    CAST(sample_size AS INT) AS sample_size,
    CAST(total_responses AS INT) AS total_responses,
    CAST(response_rate AS DECIMAL(5,2)) AS response_rate_pct
FROM source
