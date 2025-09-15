
/*
Question: What are the top-paying data analyst jobs?
- Identify the top 15 highest-paying Data Analyst roles that are available remotely or in Michigan.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into roles to pursue.
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    name AS company_name,
    job_posted_date::DATE
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    (job_location = 'Anywhere' OR job_location LIKE '%MI%') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 15;

/*
13 remote jobs and two Michigan jobs made the list.

[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "company_name": "Mantys",
    "job_posted_date": "2023-02-20"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0",
    "company_name": "Meta",
    "job_posted_date": "2023-08-23"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "job_posted_date": "2023-06-18"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "company_name": "Pinterest Job Advertisements",
    "job_posted_date": "2023-12-05"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "company_name": "Uclahealthcareers",
    "job_posted_date": "2023-01-17"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "company_name": "SmartAsset",
    "job_posted_date": "2023-08-09"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "company_name": "Inclusively",
    "job_posted_date": "2023-12-07"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "company_name": "Motional",
    "job_posted_date": "2023-01-05"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "company_name": "SmartAsset",
    "job_posted_date": "2023-07-11"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "company_name": "Get It Recruit - Information Technology",
    "job_posted_date": "2023-06-09"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170000.0",
    "company_name": "A-Line Staffing Solutions",
    "job_posted_date": "2023-08-09"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170000.0",
    "company_name": "Robert Half",
    "job_posted_date": "2023-10-06"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "job_location": "Anywhere",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000.0",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_posted_date": "2023-01-23"
  },
  {
    "job_id": 175651,
    "job_title": "Principal Data Science Analyst - DLMP",
    "job_location": "Rochester, MI",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "169686.0",
    "company_name": "Mayo Clinic",
    "job_posted_date": "2023-07-17"
  },
  {
    "job_id": 522007,
    "job_title": "Principal Data Science Analyst - Remote",
    "job_location": "Rochester, MI",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "169322.0",
    "company_name": "Mayo Clinic",
    "job_posted_date": "2023-10-17"
  }
]
*/
