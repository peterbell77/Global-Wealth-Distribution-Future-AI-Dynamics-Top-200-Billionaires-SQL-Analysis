-- ============================================================================
-- 05_advanced_analytics.sql
-- Section F: Advanced Analytical Questions [Questions 32-44]
-- ============================================================================

-- Q32. Which industry has the wealthiest billionaire?
SELECT 
    industry, 
    name AS wealthiest_billionaire, 
    networth_billion_us_dollars
FROM billionaires
ORDER BY networth_billion_us_dollars DESC
LIMIT 1;

-- Q33. Which country has the highest combined billionaire wealth?
SELECT 
    country, 
    ROUND(SUM(networth_billion_us_dollars), 2) AS combined_wealth_usd_b
FROM billionaires
GROUP BY country
ORDER BY combined_wealth_usd_b DESC
LIMIT 1;

-- Q34. Which country has the highest average billionaire net worth?
SELECT 
    country, 
    COUNT(*) AS billionaire_count,
    ROUND(AVG(networth_billion_us_dollars), 2) AS avg_net_worth_usd_b
FROM billionaires
GROUP BY country
ORDER BY avg_net_worth_usd_b DESC
LIMIT 1;

-- Q35. Which industries have at least 10 billionaires?
SELECT 
    industry, 
    COUNT(*) AS billionaire_count
FROM billionaires
GROUP BY industry
HAVING COUNT(*) >= 10
ORDER BY billionaire_count DESC;

-- Q36. How many billionaires have a net worth above $50 billion?
SELECT COUNT(*) AS billionaires_above_50b
FROM billionaires
WHERE networth_billion_us_dollars > 50;

-- Q37. What percentage of the dataset is made up of billionaires younger than 50?
SELECT 
    COUNT(CASE WHEN age < 50 THEN 1 END) AS count_under_50,
    COUNT(*) AS total_billionaires,
    ROUND(
        (COUNT(CASE WHEN age < 50 THEN 1 END) * 100.0) / COUNT(*), 
        2
    ) AS percentage_under_50
FROM billionaires;

-- Q38. Who has a net worth between $50 billion and $100 billion?
SELECT 
    rank, 
    name, 
    networth_billion_us_dollars, 
    country, 
    industry
FROM billionaires
WHERE networth_billion_us_dollars BETWEEN 50 AND 100
ORDER BY networth_billion_us_dollars DESC;

-- Q39. What is the total wealth of billionaires aged below 50?
SELECT 
    COUNT(*) AS billionaires_under_50,
    ROUND(SUM(networth_billion_us_dollars), 2) AS total_wealth_under_50_usd_b
FROM billionaires
WHERE age < 50;

-- Q40. Which country has the highest number of billionaires below age 40?
SELECT 
    country, 
    COUNT(*) AS billionaires_under_40
FROM billionaires
WHERE age < 40
GROUP BY country
ORDER BY billionaires_under_40 DESC
LIMIT 1;

-- Q41. Which industry contributes the most to the combined wealth of the top 200?
SELECT 
    industry,
    ROUND(SUM(networth_billion_us_dollars), 2) AS total_wealth_usd_b,
    ROUND(
        (SUM(networth_billion_us_dollars) * 100.0) / 
        (SELECT SUM(networth_billion_us_dollars) FROM billionaires), 
        2
    ) AS wealth_share_pct
FROM billionaires
GROUP BY industry
ORDER BY total_wealth_usd_b DESC
LIMIT 1;

-- Q42. What is the difference between the richest and poorest billionaire in the dataset?
SELECT 
    MAX(networth_billion_us_dollars) AS richest_usd_b,
    MIN(networth_billion_us_dollars) AS poorest_usd_b,
    ROUND(MAX(networth_billion_us_dollars) - MIN(networth_billion_us_dollars), 2) AS wealth_gap_usd_b
FROM billionaires;

-- Q43. What is the average net worth of billionaires aged above 70?
SELECT 
    COUNT(*) AS billionaires_above_70,
    ROUND(AVG(networth_billion_us_dollars), 2) AS avg_net_worth_above_70_usd_b
FROM billionaires
WHERE age > 70;

-- Q44. Which billionaires belong to industries with more than 10 representatives?
SELECT 
    rank,
    name,
    industry,
    country,
    networth_billion_us_dollars
FROM billionaires
WHERE industry IN (
    SELECT industry
    FROM billionaires
    GROUP BY industry
    HAVING COUNT(*) > 10
)
ORDER BY industry ASC, networth_billion_us_dollars DESC;
