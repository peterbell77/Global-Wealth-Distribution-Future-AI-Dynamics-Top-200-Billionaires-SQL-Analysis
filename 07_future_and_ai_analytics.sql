-- ============================================================================
-- 07_future_and_ai_analytics.sql
-- Project: Top 200 Richest People in the World - Future & AI Wealth Investigation
-- Description: 10 forward-looking analytical SQL queries examining AI ecosystem
--              concentration, geopolitical tech rivalry, generational age gaps,
--              and succession capital flows.
-- ============================================================================

-- AI-Q1. Technology vs. Non-Technology Wealth & Average Net Worth Comparison
SELECT 
    CASE 
        WHEN industry = 'Technology' THEN 'Technology Sector'
        ELSE 'Non-Technology Sectors'
    END AS sector_category,
    COUNT(*) AS billionaire_count,
    ROUND(SUM(networth_billion_us_dollars), 2) AS total_wealth_usd_b,
    ROUND(
        SUM(networth_billion_us_dollars) * 100.0 / 
        (SELECT SUM(networth_billion_us_dollars) FROM billionaires), 
        2
    ) AS global_wealth_share_pct,
    ROUND(AVG(networth_billion_us_dollars), 2) AS avg_net_worth_usd_b
FROM billionaires
GROUP BY sector_category
ORDER BY total_wealth_usd_b DESC;

-- AI-Q2. Total Capital Controlled by the Broader AI & Digital Ecosystem
-- (Technology, Automotive/Autonomous, Telecom, and Media & Entertainment)
SELECT 
    COUNT(*) AS ecosystem_billionaires,
    ROUND(SUM(networth_billion_us_dollars), 2) AS ecosystem_wealth_usd_b,
    ROUND(
        SUM(networth_billion_us_dollars) * 100.0 / 
        (SELECT SUM(networth_billion_us_dollars) FROM billionaires), 
        2
    ) AS ecosystem_wealth_share_pct,
    ROUND(AVG(networth_billion_us_dollars), 2) AS avg_net_worth_usd_b
FROM billionaires
WHERE industry IN ('Technology', 'Automotive', 'Telecom', 'Media & Entertainment');

-- AI-Q3. Top 10 Technology Titans and Their Share of Total Tech Wealth
WITH tech_totals AS (
    SELECT SUM(networth_billion_us_dollars) AS total_tech_wealth
    FROM billionaires
    WHERE industry = 'Technology'
)
SELECT 
    b.rank,
    b.name,
    b.age,
    b.country,
    b.networth_billion_us_dollars AS net_worth_usd_b,
    ROUND(b.networth_billion_us_dollars * 100.0 / t.total_tech_wealth, 2) AS pct_of_tech_wealth
FROM billionaires b
CROSS JOIN tech_totals t
WHERE b.industry = 'Technology'
ORDER BY b.networth_billion_us_dollars DESC
LIMIT 10;

-- AI-Q4. Geopolitical AI & Tech Rivalry: Technology Wealth Distribution by Country
SELECT 
    country,
    COUNT(*) AS tech_billionaires,
    ROUND(SUM(networth_billion_us_dollars), 2) AS total_tech_wealth_usd_b,
    ROUND(
        SUM(networth_billion_us_dollars) * 100.0 / 
        (SELECT SUM(networth_billion_us_dollars) FROM billionaires WHERE industry = 'Technology'), 
        2
    ) AS share_of_global_tech_wealth_pct,
    ROUND(AVG(networth_billion_us_dollars), 2) AS avg_tech_net_worth_usd_b
FROM billionaires
WHERE industry = 'Technology'
GROUP BY country
ORDER BY total_tech_wealth_usd_b DESC;

-- AI-Q5. Age Velocity Gap: Technology Leaders vs. Traditional Capital-Heavy Industries
SELECT 
    CASE 
        WHEN industry = 'Technology' THEN 'Technology'
        WHEN industry IN ('Manufacturing', 'Real Estate', 'Metals & Mining', 'Energy', 'Finance & Investments') 
            THEN 'Traditional Asset & Industrial Sectors'
        ELSE 'Consumer & Other Sectors'
    END AS industry_era,
    COUNT(*) AS billionaire_count,
    ROUND(AVG(age), 2) AS avg_age,
    MIN(age) AS youngest_age,
    MAX(age) AS oldest_age
FROM billionaires
GROUP BY industry_era
ORDER BY avg_age ASC;

-- AI-Q6. Next-Generation (<50) Wealth Dominance: Tech Innovators vs. Non-Tech Peers
SELECT 
    CASE 
        WHEN industry = 'Technology' THEN 'Technology (<50)'
        ELSE 'Non-Technology (<50)'
    END AS cohort,
    COUNT(*) AS billionaire_count,
    ROUND(SUM(networth_billion_us_dollars), 2) AS total_wealth_usd_b,
    ROUND(
        SUM(networth_billion_us_dollars) * 100.0 / 
        (SELECT SUM(networth_billion_us_dollars) FROM billionaires WHERE age < 50), 
        2
    ) AS share_of_under_50_wealth_pct
FROM billionaires
WHERE age < 50
GROUP BY cohort
ORDER BY total_wealth_usd_b DESC;

-- AI-Q7. The Centibillionaire Club (>$100B): Tech & Autonomous Leaders vs. Legacy Fortunes
SELECT 
    rank,
    name,
    age,
    country,
    networth_billion_us_dollars AS net_worth_usd_b,
    industry,
    CASE 
        WHEN industry IN ('Technology', 'Automotive', 'Telecom') THEN 'Tech & Digital Infrastructure'
        ELSE 'Legacy & Traditional Empires'
    END AS wealth_classification
FROM billionaires
WHERE networth_billion_us_dollars > 100
ORDER BY networth_billion_us_dollars DESC;

-- AI-Q8. Generational Capital Transition: Tech & Finance Leaders Aged 75+
SELECT 
    rank,
    name,
    age,
    country,
    industry,
    networth_billion_us_dollars AS net_worth_usd_b
FROM billionaires
WHERE age >= 75 
  AND industry IN ('Technology', 'Finance & Investments')
ORDER BY networth_billion_us_dollars DESC;

-- AI-Q9. Physical AI Infrastructure Enablers (Energy, Metals & Mining, Automotive, Telecom)
SELECT 
    industry,
    COUNT(*) AS billionaire_count,
    ROUND(SUM(networth_billion_us_dollars), 2) AS total_wealth_usd_b,
    ROUND(AVG(networth_billion_us_dollars), 2) AS avg_net_worth_usd_b
FROM billionaires
WHERE industry IN ('Energy', 'Metals & Mining', 'Automotive', 'Telecom')
GROUP BY industry
ORDER BY total_wealth_usd_b DESC;

-- AI-Q10. Founder-Led Innovation vs. Family/Dynastic Entities in Technology vs. Other Sectors
SELECT 
    CASE 
        WHEN industry = 'Technology' THEN 'Technology'
        ELSE 'Non-Technology'
    END AS sector,
    CASE 
        WHEN name LIKE '%& family%' THEN 'Family / Dynastic Entity'
        ELSE 'Individual Founder / Principal'
    END AS ownership_structure,
    COUNT(*) AS entity_count,
    ROUND(SUM(networth_billion_us_dollars), 2) AS total_wealth_usd_b,
    ROUND(AVG(networth_billion_us_dollars), 2) AS avg_wealth_usd_b
FROM billionaires
GROUP BY sector, ownership_structure
ORDER BY sector DESC, entity_count DESC;
