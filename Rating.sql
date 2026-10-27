-- 1. Salary bands (full-time)  → histogram-style column chart
Select Case WHEN salary < 300000  THEN '1. Below 3L' 
WHEN salary < 600000  THEN '2. 3L-6L' 
WHEN salary < 1000000 THEN '3. 6L-10L' 
WHEN salary < 2000000 THEN '4. 10L-20L' 
ELSE '5. 20L+' END AS salary_band,
Count (*) As Records 
From salaries_clean
Where employment_status like "full time"
Group by Salary_Band
Order by Salary_band

-- 2. Does a higher rating mean higher pay?  → column + line
SELECT CASE WHEN rating >= 4.5 THEN '4.5+'
            WHEN rating >= 4   THEN '4.0-4.4'
            WHEN rating >= 3.5 THEN '3.5-3.9'
            WHEN rating >= 3   THEN '3.0-3.4'
            ELSE 'Below 3' END AS rating_group,
       COUNT(*) AS records, ROUND(AVG(salary)) AS avg_salary
FROM salaries_clean
GROUP BY rating_group
ORDER BY Records DESC;

--3 Salary Range per role
SELECT job_role, MIN(salary) AS lowest, ROUND(AVG(salary)) AS average, MAX(salary) AS highest, Count(*) as Records
FROM salaries_clean
Where employment_status like "full time"
Group by job_role
Order by Average
