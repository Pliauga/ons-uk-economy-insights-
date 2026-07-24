-- Populate Dimension Table: Wave Metadata (Data from ONS Table 1)
INSERT INTO dim_survey_waves (wave_id, publication_date, sample_size, total_responses, response_rate) 
VALUES
(158, '2026-06-18', 38656, 10054, 26.00),
(159, '2026-07-02', 38637, 10311, 26.70),
(160, '2026-07-23', 38651, 10073, 26.10);

-- Populate Fact Table: Headline Sentiment & Business Challenges (Data from ONS Bulletin Wave 160)
INSERT INTO fact_business_insights (wave_id, category, metric_name, business_size, percentage_reporting)
VALUES
-- Trading Status Metrics (Wave 160)
(160, 'Trading Status', 'Fully Trading', 'All Businesses', 84.00),
(160, 'Trading Status', 'Partially Trading', 'All Businesses', 10.00),
(160, 'Trading Status', 'Temporarily Paused', 'All Businesses', 5.00),
(160, 'Trading Status', 'Permanently Ceased', 'All Businesses', 2.00),

-- Turnover Challenges (Wave 160)
(160, 'Turnover Challenge', 'Economic Uncertainty', 'All Businesses', 32.00),
(160, 'Turnover Challenge', 'Economic Uncertainty', '10+ Employees', 29.00),
(160, 'Turnover Challenge', 'Cost of Labour', 'All Businesses', 28.00),
(160, 'Turnover Challenge', 'Cost of Labour', '10+ Employees', 36.00),
(160, 'Turnover Challenge', 'Energy Costs', 'All Businesses', 24.00),

-- Financial & Sentiment Expectations (Wave 160)
(160, 'Financial Performance', 'Turnover Increased (June)', 'All Businesses', 17.00),
(160, 'Financial Performance', 'Turnover Increased (June)', '10+ Employees', 28.00),
(160, 'Expectations', 'Turnover Decrease Expected (August)', 'All Businesses', 18.00),
(160, 'Expectations', 'Price Increase Expected (August)', 'All Businesses', 13.00),
(160, 'Macro Risk', 'Energy Price Concern', 'All Businesses', 59.00);