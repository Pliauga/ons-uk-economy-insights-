-- Staging Model: Standardizes raw business sentiment metric names and types
WITH source AS (
    SELECT * FROM {{ source('raw_ons', 'fact_business_insights') }}
)
SELECT
    CAST(insight_id AS INT) AS insight_id,
    CAST(wave_id AS INT) AS wave_id,
    TRIM(category) AS metric_category,
    TRIM(metric_name) AS metric_name,
    TRIM(business_size) AS business_size_segment,
    CAST(percentage_reporting AS DECIMAL(5,2)) AS reported_pct
FROM source
