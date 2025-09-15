--SUBQUERY

/*
Find companies with job postings where no degree is mentioned.
*/

SELECT 
    company_id,
    name AS company_name
FROM 
    company_dim
WHERE company_id IN (
    SELECT
        company_id
    FROM
        job_postings_fact
    WHERE  
        job_no_degree_mention = true
    ORDER BY
        company_id
)

--CTE (Common Table Expressions, like a temporary result set)

/*
Find companies that have most job openings.
- Get total number of job postings per company id (job_posting_fact)
- Return the total number of jobs with the company name (company_dim)
*/
WITH company_job_count AS (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM 
    company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY 
    total_jobs DESC;