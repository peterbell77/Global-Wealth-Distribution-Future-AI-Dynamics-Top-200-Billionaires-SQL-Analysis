# 🌍 Global Wealth Distribution & Future AI Dynamics: Top 200 Billionaires SQL Analysis

![Wealth & Demographic Overview](images/wealth_and_demographic_overview.jpg)

## 📌 Project Overview
This end-to-end **SQL Data Analytics** project investigates global wealth concentration, industry dominance, demographic distributions, and artificial intelligence capital dynamics among the **Top 200 Richest People in the World** (based on the Forbes list).

Originally developed under the **FadaQa Tech Scholarship 2.0** data analytics track and expanded into a full global financial research investigation, this repository includes:
* **64 modular SQL queries** spanning schema design, data cleaning, foundational filtering, aggregations, business research questions, and forward-looking AI/technology economic analyses.
* **Raw and UTF-8 cleaned datasets** ready for immediate import into PostgreSQL, MySQL, or SQLite.
* **Executive insight reports** detailing macroeconomic findings and AI ecosystem implications.
* **High-resolution visual dashboards** summarizing geographic, demographic, and technological wealth patterns.

---

## 📂 Repository Structure
```text
top-200-billionaires-sql-analysis/
│
├── data/
│   ├── Top_200_Richest_Person_in_the_World.csv          # Original raw dataset (Latin-1 encoded)
│   └── Top_200_Richest_Person_in_the_World_Cleaned.csv  # Whitespace-trimmed UTF-8 dataset
├── sql/
│   ├── 01_schema_and_cleaning.sql                       # DDL schema, data loading & TRIM() cleaning
│   ├── 02_basic_filtering.sql                           # SELECT, DISTINCT, WHERE, BETWEEN, LIKE (Q1–Q13)
│   ├── 03_sorting_and_aggregates.sql                    # ORDER BY, COUNT, SUM, AVG, MIN, MAX (Q14–Q24)
│   ├── 04_grouped_analysis.sql                          # GROUP BY & HAVING country/industry metrics (Q25–Q31)
│   ├── 05_advanced_analytics.sql                        # Subqueries, CASE WHEN, percentage shares (Q32–Q44)
│   ├── 06_business_questions.sql                        # 10 core financial research business questions (BQ1–BQ10)
│   └── 07_future_and_ai_analytics.sql                   # 10 forward-looking AI & future economy queries (AI-Q1–AI-Q10)
├── reports/
│   ├── key_insights_summary.md                          # Core business investigation findings
│   └── future_and_ai_insights.md                        # Deep dive into AI, tech rivalry & succession capital
├── images/
│   ├── wealth_and_demographic_overview.jpg              # Dashboard 1: Macro wealth & age distribution
│   └── future_and_ai_wealth_dynamics.jpg                # Dashboard 2: AI clusters, US-China rivalry & age gap
└── README.md                                            # Master project documentation
```

---

## 🗄️ Dataset Schema & Data Quality Cleaning
The dataset contains **200 records** across **7 attributes**:

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `serial_number` | `INT` | Sequential index of the record (`1`–`200`) |
| `rank` | `INT` | Global Forbes ranking based on net worth |
| `name` | `VARCHAR(255)` | Full name of the billionaire (or family entity) |
| `age` | `INT` | Age of the billionaire in years |
| `country` | `VARCHAR(100)` | Country of citizenship or primary association |
| `networth_billion_us_dollars` | `DECIMAL(10,2)` | Total net worth expressed in billions of USD |
| `industry` | `VARCHAR(100)` | Primary industry or sector generating the wealth |

> **Data Cleaning Note:** Exploratory profiling identified trailing/leading whitespace in several `country` records (e.g., `" China"` and `" Brazil"`) as well as `Latin-1` encoding on accented characters. `01_schema_and_cleaning.sql` applies `TRIM()` across text fields so country-level aggregations (such as China's 17 billionaires and Brazil's 4 billionaires) group accurately without duplicate rows.

---

## 📊 Executive Summary & Key Findings

### 1. Macroeconomic & Demographic Overview
* **Combined Global Wealth:** **$6,368.50 billion ($6.37 trillion)** across 200 individuals, with a mean net worth of **$31.84 billion** and a mean age of **69.38 years**.
* **Right-Skewed Wealth Distribution:** Only **53 of the 200 billionaires (26.5%)** exceed the $31.84B average, led by **Bernard Arnault & family** ($233.00B), **Elon Musk** ($195.00B), and **Jeff Bezos** ($194.00B).
* **Geographic Dominance:** The **United States** hosts **79 billionaires (39.5%)** holding **$3,130.90 billion (49.16%)** of total top-200 wealth, followed by **France** ($478.80B), **India** ($434.50B), **China** ($387.40B), and **Germany** ($248.20B).
* **Generational Span:** Ages span **69 years**, from youngest **Mark Mateschitz** (Age **31**, $39.60B) to oldest **Robert Kuok** (Age **100**, $11.50B). Only **16 billionaires (8.0%)** are under age 50, holding **$508.30 billion** combined.

### 2. Future & Artificial Intelligence Wealth Dynamics
![Future & AI Wealth Dynamics](images/future_and_ai_wealth_dynamics.jpg)

* **AI & Digital Ecosystem Scale:** Combining **Technology** ($1,738.80B), **Automotive/Autonomous** ($348.60B), **Telecom** ($102.00B), and **Media & Entertainment** ($98.30B) encompasses **54 billionaires** controlling **$2,287.70 billion (35.92%)** of global top-200 wealth.
* **Top 10 Tech Concentration:** Just **10 leaders** (Bezos, Zuckerberg, Ellison, Gates, Ballmer, Page, Brin, Dell, Huang, and Zhang Yiming) control **$1,196.40 billion (68.81%)** of all Technology billionaire wealth.
* **U.S.–China AI Duopoly:** The **United States** holds **79.18% ($1,376.70B)** of global Tech billionaire wealth across 23 leaders, while **China** ranks second at **10.43% ($181.40B)** across 6 leaders.
* **12-Year Generational Speed Advantage:** Technology billionaires average **59.62 years** old compared to **71.45 years** in traditional asset-heavy sectors, and represent **73.68% ($374.50B)** of all billionaire wealth under age 50.
* **Upcoming Succession Wave:** **16 billionaires aged 75+** in Technology and Finance & Investments hold **$651.50 billion** poised for institutional and philanthropic reallocation over the next decade.

---

## 💻 Sample SQL Queries

### Countries with 5+ Billionaires (`06_business_questions.sql`)
```sql
SELECT 
    country,
    COUNT(*) AS billionaire_count,
    ROUND(SUM(networth_billion_us_dollars), 2) AS combined_net_worth_usd_b
FROM billionaires
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY billionaire_count DESC, combined_net_worth_usd_b DESC;
```

### Geopolitical AI & Technology Wealth Share (`07_future_and_ai_analytics.sql`)
```sql
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
```

---

## 🚀 How to Reproduce This Project
1. **Clone the repository:**
   ```bash
   git clone https://github.com/<your-username>/top-200-billionaires-sql-analysis.git
   cd top-200-billionaires-sql-analysis
   ```
2. **Initialize your SQL database (PostgreSQL / MySQL / SQLite):**
   * Run `sql/01_schema_and_cleaning.sql` to create the `billionaires` table.
   * Import `data/Top_200_Richest_Person_in_the_World_Cleaned.csv` (UTF-8) or `data/Top_200_Richest_Person_in_the_World.csv` (Latin-1).
3. **Run the analytical suites:**
   * Execute `02_basic_filtering.sql` through `07_future_and_ai_analytics.sql` in sequence.

---

## 🛠️ Tech Stack
* **Database & Querying:** SQL (PostgreSQL / MySQL / SQLite compatible)
* **Data Validation & Visualization:** Python (Pandas, Matplotlib, Seaborn)
* **Version Control & Documentation:** Git, GitHub, Markdown
