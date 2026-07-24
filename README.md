# ONS BICS: UK Business Health & Macro Sentiment Pipeline

## Executive Summary
An automated SQL analytics model parsing fortnightly survey waves from the Office for National Statistics (ONS) to monitor UK economic resilience, inflation sentiment, and business risk factors.

## Business Questions Answered
1. How stable are survey completion rates across BICS publication cycles?
2. What are the leading operational constraints affecting enterprise-level firms versus SMEs?
3. How do price expectations correlate with energy price concerns?

## Key SQL Skills Demonstrated
- Star Schema Data Modeling (Fact & Dimension Tables)
- Window Functions (`LAG`, `DENSE_RANK`) for trend & variance analysis
- Common Table Expressions (CTEs) for clean query design

## Tech Stack
- SQL Engine: PostgreSQL / Snowflake
- Dashboard Layer: Tableau / Power BI

Why I built this:
I wanted to build a project using real-world public datasets rather than toy data like Superstore or Titanic. I took raw survey waves from the Office for National Statistics (ONS) Business Insights report to see what UK companies are actually reporting regarding turnover, inflation, and hiring challenges.
This repo contains the database setup, data transformations, window function queries comparing SMEs against larger enterprises, and a couple of Python scripts to visualize the main trends.
