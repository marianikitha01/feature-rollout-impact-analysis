
# Feature Rollout Impact Analysis (A/B Testing + SQL + Azure DevOps)

A complete, industry-level A/B testing project that evaluates the impact of a new feature rollout on user behavior for a simulated subscription-based SaaS platform. The analysis covers churn, retention, satisfaction, and feature adoption using SQL, Python, and DevOps tools.

## Project Overview

This project simulates the lifecycle of a data analytics initiative for a product team evaluating the success of a new feature. It involves:

- Loading and transforming A/B test data into a PostgreSQL database
- Running advanced SQL queries for behavioral segmentation
- Performing statistical validation in Python
- Managing the entire lifecycle using Azure DevOps and Git
- Setting up CI/CD with Azure Pipelines

---

## Project Structure

```
feature-rollout-impact-analysis/
│
├── data/                        # Raw and enhanced CSV data
├── sql_queries/                 # SQL scripts for analysis
├── azure-pipelines.yml          # CI/CD configuration
├── load_to_postgres.py          # Script to load data into PostgreSQL
├── enhance_dataset.py           # Script to simulate additional metrics
├── ab_test_analysis.py          # Statistical tests in Python
├── results/                     # Saved analysis results (CSV/Excel)
└── README.md
```

---

## Key Analyses Performed

- A/B Test: Conversion Rate, Tasks Completed, Churn, and Satisfaction (Statistical significance using `scipy`)
- Cohort Analysis: Signup-based retention trends
- Rolling 7-day engagement using SQL window functions
- Feature adoption trends based on simulated flags
- Segmented churn by satisfaction levels

---

## Tools & Technologies

- **SQL (PostgreSQL):** Complex queries, CTEs, window functions, UDFs
- **Python:** Pandas, SciPy for statistical testing
- **Azure DevOps:** Boards for Agile workflow (Epics → Features → Tasks)
- **CI/CD (Optional):** Azure Pipelines with YAML + Git integration

---

## Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/marianikitha01/feature-rollout-impact-analysis.git
   ```

2. **Set up PostgreSQL and load data:**
   - Create a new database
   - Run `load_to_postgres.py` to insert CSV into the DB

3. **Run SQL analysis:**
   - Use scripts from `/sql_queries` folder via pgAdmin or DBeaver
   - Save results to `/results`

4. **Run statistical tests:**
   ```bash
   python ab_test_analysis.py
   ```

5. **CI/CD Setup:**
   - Add `azure-pipelines.yml` to Azure DevOps
   - Request parallelism grant if needed

---

## Results

| Metric                    | p-value  | Significant |
|---------------------------|----------|-------------|
| Conversion Rate (A/B)     | 0.2182   |     No      |
| Churn Rate                | 0.0000   |     Yes     |
| Tasks Completed           | 0.0000   |     Yes     |
| Satisfaction Score        | 0.0000   |     Yes     |

---


