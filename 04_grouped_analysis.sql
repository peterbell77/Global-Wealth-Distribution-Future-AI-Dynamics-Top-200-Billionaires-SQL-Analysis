-- ============================================================================
-- 04_grouped_analysis.sql
-- Section E: Categorizing Data by GROUP BY [Questions 25-31]
-- ============================================================================

-- Q25. How many billionaires does each country have?
SELECT 
    country, 
    COUNT(*) AS billionaire_count
FROM billionaires
GROUP BY country
ORDER BY billionaire_count DESC, country ASC;

-- Q26. Which industry has the highest number of billionaires?
SELECT 
    industry, 
    COUNT(*) AS billionaire_count
FROM billionaires
GROUP BY industry
ORDER BY billionaire_count DESC
LIMIT 1;

-- Q27. What is the average net worth of billionaires in each country?
SELECT 
    country, 
    COUNT(*) AS billionaire_count,
    ROUND(AVG(networth_billion_us_dollars), 2) AS avg_net_worth_usd_b
FROM billionaires
GROUP BY country
ORDER BY avg_net_worth_usd_b DESC;

-- Q28. What is the total net worth of billionaires in each industry?
SELECT 
    industry, 
    COUNT(*) AS billionaire_count,
    ROUND(SUM(networth_billion_us_dollars), 2) AS total_net_worth_usd_b
FROM billionaires
GROUP BY industry
ORDER BY total_net_worth_usd_b DESC;

-- Q29. Which country has the oldest average billionaire population?
SELECT 
    country, 
    COUNT(*) AS billionaire_count,
    ROUND(AVG(age), 2) AS avg_age
FROM billionaires
GROUP BY country
ORDER BY avg_age DESC
LIMIT 1;

-- Q30. Which industry has the highest average billionaire age?
SELECT 
    industry, 
    COUNT(*) AS billionaire_count,
    ROUND(AVG(age), 2) AS avg_age
FROM billionaires
GROUP BY industry
ORDER BY avg_age DESC
LIMIT 1;

-- Q31. Which countries have at least five billionaires in the dataset?
SELECT 
    country, 
    COUNT(*) AS billionaire_count
FROM billionaires
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY billionaire_count DESC;
