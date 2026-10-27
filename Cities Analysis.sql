-- 1. Full-time pay by city (cities with 50+ records)  → bar / map
Select location, Count(*) As Record, Round(Avg(Salary)) As AVG_Salary
From salaries_clean
Where employment_status like "Full Time"
Group by location
Having Count (*)>=50
Order by location Asc 

-- 2. City x role  → heatmap (matrix with colour scale)
Select location, job_role, Count(*) As Record, Round(Avg(Salary)) As AVG_Salary
From salaries_clean
Where employment_status like "Full Time"
Group by location, job_role
Having Count (*)>=50
Order by location, AvG_salary Asc 

-- 3. Where the jobs are  → donut / bar
SELECT location, COUNT(*) AS records,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM salaries_clean), 1) AS pct_of_total
FROM salaries_clean
GROUP BY location
ORDER BY records DESC;



