-- ============================================================================
-- QUERY 1: Survey Response Velocity & Health Analysis
-- Demonstrates: CTEs, Window Functions (LAG), Percentage Change Calculations
-- ============================================================================
WITH wave_metrics AS (
    SELECT 
        wave_id,
        publication_date,
        sample_size,
        total_responses,
        response_rate,
        LAG(total_responses) OVER (ORDER BY wave_id) AS prev_responses,
        LAG(response_rate) OVER (ORDER BY wave_id) AS prev_response_rate
    FROM dim_survey_waves
)
SELECT 
    wave_id,
    publication_date,
    sample_size,
    total_responses,
    response_rate AS current_response_rate_pct,
    (total_responses - prev_responses) AS response_count_delta,
    ROUND(
        ((total_responses - prev_responses)::NUMERIC / NULLIF(prev_responses, 0)) * 100, 2
    ) AS response_volume_growth_pct,
    ROUND((response_rate - prev_response_rate), 2) AS rate_point_diff
FROM wave_metrics;


-- ============================================================================
-- QUERY 2: Ranking Disparity in Turnover Threats (SMEs vs. Large Firms)
-- Demonstrates: Window Functions (DENSE_RANK), Partitioning, Case Logic
-- ============================================================================
WITH ranked_challenges AS (
    SELECT 
        wave_id,
        business_size,
        metric_name AS challenge_type,
        percentage_reporting,
        DENSE_RANK() OVER (
            PARTITION BY wave_id, business_size 
            ORDER BY percentage_reporting DESC
        ) AS severity_rank
    FROM fact_business_insights
    WHERE category = 'Turnover Challenge'
)
SELECT 
    wave_id,
    business_size,
    severity_rank,
    challenge_type,
    percentage_reporting AS percentage_affected
FROM ranked_challenges
WHERE severity_rank <= 2
ORDER BY business_size, severity_rank;


-- ============================================================================
-- QUERY 3: Macro Uncertainty vs. Operational Performance Matrix
-- Demonstrates: Pivot/Conditional Aggregation, CASE statements
-- ============================================================================
SELECT 
    wave_id,
    MAX(CASE WHEN metric_name = 'Economic Uncertainty' AND business_size = 'All Businesses' THEN percentage_reporting END) AS economic_uncertainty_pct,
    MAX(CASE WHEN metric_name = 'Cost of Labour' AND business_size = '10+ Employees' THEN percentage_reporting END) AS labour_cost_large_firms_pct,
    MAX(CASE WHEN metric_name = 'Energy Price Concern' THEN percentage_reporting END) AS energy_concern_pct,
    MAX(CASE WHEN metric_name = 'Turnover Decrease Expected (August)' THEN percentage_reporting END) AS expected_turnover_decline_pct
FROM fact_business_insights
WHERE wave_id = 160
GROUP BY wave_id;