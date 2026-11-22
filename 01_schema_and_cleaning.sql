-- ============================================================================
-- 01_schema_and_cleaning.sql
-- Project: Top 200 Richest People in the World - SQL Analysis
-- Description: Database schema creation, data loading guidance, and cleaning
-- ============================================================================

DROP TABLE IF EXISTS billionaires;

CREATE TABLE billionaires (
    serial_number INT PRIMARY KEY,
    rank INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    age INT,
    country VARCHAR(100),
    networth_billion_us_dollars DECIMAL(10, 2),
    industry VARCHAR(100)
);

-- Example PostgreSQL COPY command (use LATIN1 encoding for raw CSV or UTF8 for cleaned CSV):
-- \copy billionaires FROM 'data/Top_200_Richest_Person_in_the_World.csv' WITH (FORMAT csv, HEADER true, ENCODING 'LATIN1');

-- Data Cleaning: Trim leading/trailing whitespace from text columns
UPDATE billionaires
SET 
    name = TRIM(name),
    country = TRIM(country),
    industry = TRIM(industry);

-- Verify record count and check for missing values
SELECT 
    COUNT(*) AS total_rows,
    COUNT(age) AS non_null_age,
    COUNT(country) AS non_null_country,
    COUNT(networth_billion_us_dollars) AS non_null_networth,
    COUNT(industry) AS non_null_industry
FROM billionaires;
