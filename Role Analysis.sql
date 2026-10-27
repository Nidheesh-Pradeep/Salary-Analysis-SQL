-- 1. Average salary by role  → bar chart
SELECT job_role, COUNT(*) AS records, ROUND(AVG(salary)) AS avg_salary
FROM salaries_clean
GROUP BY job_role
ORDER BY avg_salary DESC;

-- 2. Pay by employment type  → column chart
SELECT employment_status, COUNT(*) AS records, ROUND(AVG(salary)) AS avg_salary
FROM salaries_clean
GROUP BY employment_status
ORDER BY avg_salary DESC;

-- 3. Role x employment type  → clustered bar or matrix
SELECT job_role, employment_status, ROUND(AVG(salary)) AS avg_salary
FROM salaries_clean
GROUP BY job_role, employment_status
ORDER BY job_role;