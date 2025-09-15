/*
Question: What are the most optimal skills to learn (aka it's in high demand AND a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concencrates on remote or MI positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
*/

-- Modified Query 3 CTE (top demanded skills)
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND (job_work_from_home = true OR job_location LIKE '%MI%')
    GROUP BY
        skills_dim.skill_id
)

-- Modified Query 4 CTE (top paying skills)
,average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND (job_work_from_home = true OR job_location LIKE '%MI%')
    GROUP BY
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
    AND skills_demand.skill_id <> '7' -- Noticed duplicated skill in table
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;


-- same query rewritten to be more concise
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND (job_work_from_home = true OR job_location LIKE '%MI%')
    AND skills_dim.skill_id <> '7' -- Noticed duplicated skill in table
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;