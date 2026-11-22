-- ============================================================================
-- 02_basic_filtering.sql
-- Section A: Basic SQL Queries (SELECT, FROM, LIMIT, DISTINCT) [Questions 1-5]
-- Section B: Filtering Data Using WHERE [Questions 6-13]
-- ============================================================================

-- Q1. What does the entire dataset look like?
SELECT * 
FROM billionaires;

-- Q2. What are the names, ages and net worths of the billionaires?
SELECT 
    name, 
    age, 
    networth_billion_us_dollars 
FROM billionaires;

-- Q3. Who are the first 10 billionaires in the dataset?
SELECT * 
FROM billionaires
ORDER BY serial_number ASC
LIMIT 10;

-- Q4. Which countries are represented in the dataset?
SELECT DISTINCT country 
FROM billionaires
ORDER BY country ASC;

-- Q5. Which industries are represented among the world's richest people?
SELECT DISTINCT industry 
FROM billionaires
ORDER BY industry ASC;

-- Q6. Who are the billionaires younger than 40 years?
SELECT 
    rank, 
    name, 
    age, 
    country, 
    networth_billion_us_dollars, 
    industry
FROM billionaires
WHERE age < 40
ORDER BY age ASC;

-- Q7. Who are the billionaires with a net worth greater than $100 billion?
SELECT 
    rank, 
    name, 
    networth_billion_us_dollars, 
    country, 
    industry
FROM billionaires
WHERE networth_billion_us_dollars > 100
ORDER BY networth_billion_us_dollars DESC;

-- Q8. Who are the billionaires from Nigeria?
SELECT * 
FROM billionaires
WHERE country = 'Nigeria';

-- Q9. Who are the billionaires aged between 40 and 60?
SELECT 
    rank, 
    name, 
    age, 
    country, 
    networth_billion_us_dollars
FROM billionaires
WHERE age BETWEEN 40 AND 60
ORDER BY age ASC;

-- Q10. Who are the billionaires from the United States, China and India?
SELECT 
    rank, 
    name, 
    country, 
    networth_billion_us_dollars, 
    industry
FROM billionaires
WHERE country IN ('United States', 'China', 'India')
ORDER BY country ASC, networth_billion_us_dollars DESC;

-- Q11. Who are the billionaires whose names begin with the letter A?
SELECT 
    rank, 
    name, 
    country, 
    networth_billion_us_dollars
FROM billionaires
WHERE name LIKE 'A%'
ORDER BY name ASC;

-- Q12. Who are the billionaires aged above 60 with a net worth greater than $50 billion?
SELECT 
    rank, 
    name, 
    age, 
    networth_billion_us_dollars, 
    country, 
    industry
FROM billionaires
WHERE age > 60 
  AND networth_billion_us_dollars > 50
ORDER BY networth_billion_us_dollars DESC;

-- Q13. Who are the billionaires from Nigeria or South Africa?
SELECT 
    rank, 
    name, 
    country, 
    age, 
    networth_billion_us_dollars, 
    industry
FROM billionaires
WHERE country IN ('Nigeria', 'South Africa')
ORDER BY networth_billion_us_dollars DESC;
