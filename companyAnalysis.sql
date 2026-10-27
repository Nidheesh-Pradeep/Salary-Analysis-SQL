-- 1. Top paying companies (10+ records)  → scatter: rating vs salary
Select Company, Salary, Count(*) As Record, ROund(Avg(Salary)) as AVG_salary
From salaries_clean
Group by company
Having Record >=10
Order by AVG_Salary Asc
LIMIT 15

-- 2. Top 3 paying companies per role  → small multiples / table
WITH ranked AS (
  SELECT job_role, company, ROUND(AVG(salary)) AS avg_salary,
         RANK() OVER (PARTITION BY job_role ORDER BY AVG(salary) DESC) AS rnk
  FROM salaries_clean
  GROUP BY job_role, company
  HAVING COUNT(*) >= 5
)
SELECT * FROM ranked WHERE rnk <= 3;

-- 3. Biggest employers by records  → bar chart
Select Company, Count(*) as record, Round(Avg(salary)) as AVG_salary
From salaries_clean
Group by Company
Order by Avg_Salary DESC
Limit 15






