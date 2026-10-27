# Salary Analysis of Indian Software Roles (SQL)

SQL analysis of ~22,700 software salary records from India, covering data cleaning, pay by role, city and company, and the link between company rating and pay.

**Tools:** SQLite, DB Browser for SQLite, VS Code
**SQL skills used:** CTEs, window functions (`RANK`), `CASE` segmentation, aggregation with `HAVING`, subqueries, data-quality checks

## Data
- Source: [Kaggle dataset, add link here](https://www.kaggle.com/)
- 22,770 records: company, job title, role, salary, rating, location, employment status
- Salaries are assumed to be annual, in INR

## Data cleaning (`sql/01_data_cleaning.sql`)
The raw data was audited first, then cleaned into a new `salaries_clean` table, leaving the original data untouched.

| Issue | Rule applied |
|---|---|
| Missing company name | Removed (1 row) |
| Junk company names with no letters (e.g. `-`, `2018`) | Removed (11 rows) |
| Impossible salaries (under ₹10,000 or over ₹2 crore, including one ₹9 crore "SDE") | Removed (3 rows) |
| Extra whitespace in text fields | Trimmed |
| Duplicate records | Checked, none found |

**Result: 22,770 rows → 22,755 rows.** Companies whose names start with a digit (like "3Embed") were deliberately kept.

## Key findings
- **Role:** Database (~₹9.6L) and Mobile (~₹8.8L) roles have the highest average pay, ahead of SDE (~₹8.4L).
- **Employment type:** Full-time averages ~₹7.3L, contractors ~₹6.3L, interns ~₹3.6L.
- **City:** Among full-time roles, Mumbai leads at ~₹10.2L, ahead of Kolkata (~₹8.0L) and Bangalore (~₹7.8L).
- **Companies:** Gojek, Hotstar and ShareChat top the list (10+ records each), averaging ₹20L+.
- **Rating vs pay:** Higher ratings don't mean steadily higher pay. Companies rated 4.0–4.4 average ~₹7.3L, while those rated 4.5+ average ~₹6.4L.
- **Distribution:** Most full-time salaries sit between ₹3L and ₹10L, and only about 5% earn ₹20L+.

## Charts
![Average salary by role](images/role_salary.png)
![Average salary by city](images/city_salary.png)
![Rating vs salary](images/rating_vs_salary.png)

## Project structure
```
sql/        5 query files (cleaning + 4 analysis scripts)
data/       source CSV
results/    exported query results
images/     charts
```

## How to reproduce
1. Download the dataset from Kaggle and place the CSV in `data/`.
2. In DB Browser for SQLite, create a new database and import the CSV as a table named `salaries`.
3. Run `sql/01_data_cleaning.sql`, then the analysis files in order.

## Limitations
- Salaries are self-reported, so they may be inaccurate.
- Some cities and roles have small sample sizes, so I filtered with `HAVING COUNT(*) >= n`.
- The data is for software roles in India and doesn't cover financial services or the UAE.

## About me
Data and Quality Analyst with experience in financial services operations, SLA/KPI monitoring and quality auditing. Open to data analyst roles in Dubai.
[LinkedIn](https://linkedin.com/in/your-handle) · your.email@example.com
