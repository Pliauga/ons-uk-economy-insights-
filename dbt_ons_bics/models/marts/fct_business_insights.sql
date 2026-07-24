-- Mart Fact Model: Ranks severity of business risk factors by company size segment
WITH staging AS (
    SELECT * FROM {{ ref('stg_ons_business_insights') }}
)
SELECT
    insight_id,
    wave_id,
    metric_category,
    metric_name,
    business_size_segment,
    reported_pct,
    DENSE_RANK() OVER (
        PARTITION BY wave_id, metric_category, business_size_segment 
        ORDER BY reported_pct DESC
    ) AS challenge_severity_rank
FROM staging
