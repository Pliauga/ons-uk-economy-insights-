-- Mart Dimension Model: Calculates wave response deltas and velocity
WITH staging AS (
    SELECT * FROM {{ ref('stg_ons_survey_waves') }}
)
SELECT
    wave_id,
    publication_date,
    sample_size,
    total_responses,
    response_rate_pct,
    LAG(total_responses) OVER (ORDER BY wave_id) AS prev_wave_responses,
    total_responses - LAG(total_responses) OVER (ORDER BY wave_id) AS response_volume_delta,
    ROUND(
        (response_rate_pct - LAG(response_rate_pct) OVER (ORDER BY wave_id)), 2
    ) AS response_rate_point_diff
FROM staging
