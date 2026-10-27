-- 1. Audit the raw data first
SELECT COUNT(*) AS total_rows,
       SUM("Company Name" IS NULL) AS missing_company,
       SUM("Company Name" NOT GLOB '*[A-Za-z]*') AS junk_company_names,
       SUM(Salary < 10000 OR Salary > 20000000) AS salary_outliers
FROM salaries;

-- 2. Create the cleaned table
DROP TABLE IF EXISTS salaries_clean;

CREATE TABLE salaries_clean AS
SELECT DISTINCT
       Rating                  AS rating,
       TRIM("Company Name")    AS company,
       TRIM("Job Title")       AS job_title,
       Salary                  AS salary,
       "Salaries Reported"     AS salaries_reported,
       TRIM(Location)          AS location,
       TRIM("Employment Status") AS employment_status,
       TRIM("Job Roles")       AS job_role
FROM salaries
WHERE "Company Name" IS NOT NULL
  AND "Company Name" GLOB '*[A-Za-z]*'
  AND Salary BETWEEN 10000 AND 20000000;

-- 3. Validate: rows before vs after
SELECT (SELECT COUNT(*) FROM salaries) AS raw_rows,
       (SELECT COUNT(*) FROM salaries_clean) AS clean_rows;