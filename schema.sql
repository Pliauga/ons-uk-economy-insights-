-- Dimension Table: Survey Waves Metadata
CREATE TABLE dim_survey_waves (
    wave_id INT PRIMARY KEY,
    publication_date DATE NOT NULL,
    sample_size INT NOT NULL,
    total_responses INT NOT NULL,
    response_rate DECIMAL(5,2) NOT NULL
);

-- Fact Table: Business Sentiment Metrics
CREATE TABLE fact_business_insights (
    insight_id SERIAL PRIMARY KEY,
    wave_id INT REFERENCES dim_survey_waves(wave_id),
    category VARCHAR(100),       -- e.g., 'Turnover Challenge', 'Price Expectations'
    metric_name VARCHAR(150),    -- e.g., 'Economic Uncertainty', 'Cost of Labour'
    business_size VARCHAR(50),   -- e.g., 'All Businesses', '10+ Employees'
    percentage_reporting DECIMAL(5,2)
);