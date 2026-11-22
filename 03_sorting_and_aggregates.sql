-- ============================================================================
-- 03_sorting_and_aggregates.sql
-- Section C: Sorting Data Using ORDER BY [Questions 14-17]
-- Section D: Aggregate Functions (COUNT, SUM, AVG, MAX, MIN) [Questions 18-24]
-- ============================================================================

-- Q14. Who is the richest person in the dataset?
SELECT 
    rank, 
    name, 
    networth_billion_us_dollars, 
    country, 
    industry
FROM billionaires
ORDER BY networth_billion_us_dollars DESC
LIMIT 1;

-- Q15. Who is the youngest billionaire?
SELECT 
    rank, 
    name, 
    age, 
    networth_billion_us_dollars, 
    country, 
    industry
FROM billionaires
ORDER BY age ASC
LIMIT 1;

-- Q16. Who are the five oldest billionaires?
SELECT 
    rank, 
    name, 
    age, 
    country, 
    networth_billion_us_dollars
FROM billionaires
ORDER BY age DESC
LIMIT 5;

-- Q17. Who are the ten wealthiest billionaires?
SELECT 
    rank, 
    name, 
    networth_billion_us_dollars, 
    age, 
    country, 
    industry
FROM billionaires
ORDER BY networth_billion_us_dollars DESC
LIMIT 10;

-- Q18. How many billionaires are represented in the dataset?
SELECT COUNT(*) AS total_billionaires
FROM billionaires;

-- Q19. What is the combined net worth of all 200 billionaires?
SELECT ROUND(SUM(networth_billion_us_dollars), 2) AS combined_net_worth_usd_b
FROM billionaires;

-- Q20. What is the average net worth of the billionaires?
SELECT ROUND(AVG(networth_billion_us_dollars), 2) AS average_net_worth_usd_b
FROM billionaires;

-- Q21. What is the average age of the billionaires?
SELECT ROUND(AVG(age), 2) AS average_age
FROM billionaires;

-- Q22. What is the highest net worth recorded?
SELECT MAX(networth_billion_us_dollars) AS highest_net_worth_usd_b
FROM billionaires;

-- Q23. What is the lowest net worth recorded?
SELECT MIN(networth_billion_us_dollars) AS lowest_net_worth_usd_b
FROM billionaires;

-- Q24. What is the age difference between the oldest and youngest billionaires?
SELECT 
    MAX(age) AS oldest_age,
    MIN(age) AS youngest_age,
    MAX(age) - MIN(age) AS age_difference
FROM billionaires;
