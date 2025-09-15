/* UNIONS */

-- January
SELECT
    job_title_short,
    company_id,
    job_location
FROM 
    january_jobs

UNION

-- February
SELECT
    job_title_short,
    company_id,
    job_location
FROM 
    february_jobs

UNION

-- March
SELECT
    job_title_short,
    company_id,
    job_location
FROM 
    march_jobs

/* UNION ALL would show duplicates */

