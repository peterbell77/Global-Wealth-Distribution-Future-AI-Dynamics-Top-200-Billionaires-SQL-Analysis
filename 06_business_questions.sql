-- ============================================================================
-- 06_business_questions.sql
-- Project: SQL Project - The Billionaire Wealth Investigation
-- Description: Solutions to all 10 business questions for global financial research
-- ============================================================================

-- BQ1. Retrieve the 20 richest billionaires.
SELECT 
    rank,
    name,
    age,
    country,
    networth_billion_us_dollars AS net_worth_usd_b,
    industry
FROM billionaires
ORDER BY networth_billion_us_dollars DESC
LIMIT 20;

-- BQ2. Identify the five youngest billionaires.
SELECT 
    rank,
    name,
    age,
    country,
    networth_billion_us_dollars AS net_worth_usd_b,
    industry
FROM billionaires
ORDER BY age ASC, networth_billion_us_dollars DESC
LIMIT 5;

-- BQ3. Calculate the average age and average net worth.
SELECT 
    ROUND(AVG(age), 2) AS average_age,
    ROUND(AVG(networth_billion_us_dollars), 2) AS average_net_worth_usd_b
FROM billionaires;

-- BQ4. Identify the five most represented countries.
SELECT 
    country,
    COUNT(*) AS billionaire_count
FROM billionaires
GROUP BY country
ORDER BY billionaire_count DESC, country ASC
LIMIT 5;

-- BQ5. Calculate the combined net worth of billionaires from each country.
SELECT 
    country,
    COUNT(*) AS billionaire_count,
    ROUND(SUM(networth_billion_us_dollars), 2) AS combined_net_worth_usd_b,
    ROUND(AVG(networth_billion_us_dollars), 2) AS avg_net_worth_usd_b
FROM billionaires
GROUP BY country
ORDER BY combined_net_worth_usd_b DESC;

-- BQ6. Identify the five industries with the highest number of billionaires.
SELECT 
    industry,
    COUNT(*) AS billionaire_count
FROM billionaires
GROUP BY industry
ORDER BY billionaire_count DESC, industry ASC
LIMIT 5;

-- BQ7. Find countries with at least five billionaires.
SELECT 
    country,
    COUNT(*) AS billionaire_count,
    ROUND(SUM(networth_billion_us_dollars), 2) AS combined_net_worth_usd_b
FROM billionaires
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY billionaire_count DESC, combined_net_worth_usd_b DESC;

-- BQ8. Calculate the total wealth of billionaires younger than 50.
SELECT 
    COUNT(*) AS billionaires_under_50,
    ROUND(SUM(networth_billion_us_dollars), 2) AS total_wealth_under_50_usd_b
FROM billionaires
WHERE age < 50;

-- BQ9. Identify billionaires whose net worth exceeds the overall average net worth.
SELECT 
    rank,
    name,
    age,
    country,
    networth_billion_us_dollars AS net_worth_usd_b,
    industry
FROM billionaires
WHERE networth_billion_us_dollars > (
    SELECT AVG(networth_billion_us_dollars) 
    FROM billionaires
)
ORDER BY networth_billion_us_dollars DESC;

-- BQ10. Identify the industry with the highest average net worth.
SELECT 
    industry,
    COUNT(*) AS billionaire_count,
    ROUND(AVG(networth_billion_us_dollars), 2) AS avg_net_worth_usd_b,
    ROUND(SUM(networth_billion_us_dollars), 2) AS total_net_worth_usd_b
FROM billionaires
GROUP BY industry
ORDER BY avg_net_worth_usd_b DESC
LIMIT 1;
