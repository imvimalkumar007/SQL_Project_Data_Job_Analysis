/* 
Questions: What skills are required for the top-payinhg business analyst roles?
- Use the to 10 highest-paying business analyst jobs from the first query.
- Add the specific skills required for these roles. 
- Why? It proves a detailed look at which high-paying jobs demand certain skills, helping jobs seekers understand which skills to develop that align with top salaries. 
*/


WITH top_paying_jobs AS
(
    SELECT
        job_id, 
        job_title, 
        salary_year_avg, 
        job_posted_date,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim ON 
        job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Business Analyst' AND
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg ASC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN
    skills_job_dim ON
    top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;


/*
1. Excel - Most frequently mentioned, indicating its widespread use for data analysis, reporting, and modeling.
2. SQL - High demand for querying and managing databases, essential for data-driven decision-making.
3. JavaScript - Reflects the need for programming or scripting skills in some business analyst roles.
4. Sheets (Google Sheets) - Popular for collaborative and cloud-based data handling and reporting.

[
  {
    "job_id": 1348933,
    "job_title": "Business Analyst",
    "salary_year_avg": "62500.0",
    "job_posted_date": "2023-06-05 18:01:46",
    "company_name": "Kaye/Bassman International",
    "skills": "sql"
  },
  {
    "job_id": 1348933,
    "job_title": "Business Analyst",
    "salary_year_avg": "62500.0",
    "job_posted_date": "2023-06-05 18:01:46",
    "company_name": "Kaye/Bassman International",
    "skills": "smartsheet"
  },
  {
    "job_id": 1348933,
    "job_title": "Business Analyst",
    "salary_year_avg": "62500.0",
    "job_posted_date": "2023-06-05 18:01:46",
    "company_name": "Kaye/Bassman International",
    "skills": "sheets"
  },
  {
    "job_id": 1348933,
    "job_title": "Business Analyst",
    "salary_year_avg": "62500.0",
    "job_posted_date": "2023-06-05 18:01:46",
    "company_name": "Kaye/Bassman International",
    "skills": "excel"
  },
  {
    "job_id": 319129,
    "job_title": "Analyst",
    "salary_year_avg": "60000.0",
    "job_posted_date": "2023-09-10 10:00:23",
    "company_name": "Get It Recruit - Finance",
    "skills": "sql"
  },
  {
    "job_id": 609676,
    "job_title": "Analyst, Revenue Operation",
    "salary_year_avg": "60000.0",
    "job_posted_date": "2023-11-03 10:18:03",
    "company_name": "Togetherall",
    "skills": "slack"
  },
  {
    "job_id": 319129,
    "job_title": "Analyst",
    "salary_year_avg": "60000.0",
    "job_posted_date": "2023-09-10 10:00:23",
    "company_name": "Get It Recruit - Finance",
    "skills": "excel"
  },
  {
    "job_id": 319129,
    "job_title": "Analyst",
    "salary_year_avg": "60000.0",
    "job_posted_date": "2023-09-10 10:00:23",
    "company_name": "Get It Recruit - Finance",
    "skills": "javascript"
  },
  {
    "job_id": 609676,
    "job_title": "Analyst, Revenue Operation",
    "salary_year_avg": "60000.0",
    "job_posted_date": "2023-11-03 10:18:03",
    "company_name": "Togetherall",
    "skills": "excel"
  },
  {
    "job_id": 319129,
    "job_title": "Analyst",
    "salary_year_avg": "60000.0",
    "job_posted_date": "2023-09-10 10:00:23",
    "company_name": "Get It Recruit - Finance",
    "skills": "tableau"
  },
  {
    "job_id": 319129,
    "job_title": "Analyst",
    "salary_year_avg": "60000.0",
    "job_posted_date": "2023-09-10 10:00:23",
    "company_name": "Get It Recruit - Finance",
    "skills": "sheets"
  },
  {
    "job_id": 144805,
    "job_title": "Jr. Business Analyst",
    "salary_year_avg": "57500.0",
    "job_posted_date": "2023-09-11 15:00:04",
    "company_name": "Technology Talent Network LLC",
    "skills": "flow"
  },
  {
    "job_id": 732042,
    "job_title": "HR Systems Analyst (FT)",
    "salary_year_avg": "55500.0",
    "job_posted_date": "2023-04-18 11:02:59",
    "company_name": "PSCU",
    "skills": "oracle"
  },
  {
    "job_id": 732042,
    "job_title": "HR Systems Analyst (FT)",
    "salary_year_avg": "55500.0",
    "job_posted_date": "2023-04-18 11:02:59",
    "company_name": "PSCU",
    "skills": "sql"
  },
  {
    "job_id": 732042,
    "job_title": "HR Systems Analyst (FT)",
    "salary_year_avg": "55500.0",
    "job_posted_date": "2023-04-18 11:02:59",
    "company_name": "PSCU",
    "skills": "java"
  },
  {
    "job_id": 732042,
    "job_title": "HR Systems Analyst (FT)",
    "salary_year_avg": "55500.0",
    "job_posted_date": "2023-04-18 11:02:59",
    "company_name": "PSCU",
    "skills": "javascript"
  },
  {
    "job_id": 732042,
    "job_title": "HR Systems Analyst (FT)",
    "salary_year_avg": "55500.0",
    "job_posted_date": "2023-04-18 11:02:59",
    "company_name": "PSCU",
    "skills": "c#"
  },
  {
    "job_id": 732042,
    "job_title": "HR Systems Analyst (FT)",
    "salary_year_avg": "55500.0",
    "job_posted_date": "2023-04-18 11:02:59",
    "company_name": "PSCU",
    "skills": "php"
  },
  {
    "job_id": 732042,
    "job_title": "HR Systems Analyst (FT)",
    "salary_year_avg": "55500.0",
    "job_posted_date": "2023-04-18 11:02:59",
    "company_name": "PSCU",
    "skills": "mysql"
  },
  {
    "job_id": 732042,
    "job_title": "HR Systems Analyst (FT)",
    "salary_year_avg": "55500.0",
    "job_posted_date": "2023-04-18 11:02:59",
    "company_name": "PSCU",
    "skills": "jquery"
  },
  {
    "job_id": 114627,
    "job_title": "Operations Analyst",
    "salary_year_avg": "55000.0",
    "job_posted_date": "2023-10-30 15:01:08",
    "company_name": "Get It Recruit - Finance",
    "skills": "sql"
  },
  {
    "job_id": 114627,
    "job_title": "Operations Analyst",
    "salary_year_avg": "55000.0",
    "job_posted_date": "2023-10-30 15:01:08",
    "company_name": "Get It Recruit - Finance",
    "skills": "spss"
  },
  {
    "job_id": 114627,
    "job_title": "Operations Analyst",
    "salary_year_avg": "55000.0",
    "job_posted_date": "2023-10-30 15:01:08",
    "company_name": "Get It Recruit - Finance",
    "skills": "sas"
  },
  {
    "job_id": 114627,
    "job_title": "Operations Analyst",
    "salary_year_avg": "55000.0",
    "job_posted_date": "2023-10-30 15:01:08",
    "company_name": "Get It Recruit - Finance",
    "skills": "excel"
  },
  {
    "job_id": 114627,
    "job_title": "Operations Analyst",
    "salary_year_avg": "55000.0",
    "job_posted_date": "2023-10-30 15:01:08",
    "company_name": "Get It Recruit - Finance",
    "skills": "javascript"
  },
  {
    "job_id": 114627,
    "job_title": "Operations Analyst",
    "salary_year_avg": "55000.0",
    "job_posted_date": "2023-10-30 15:01:08",
    "company_name": "Get It Recruit - Finance",
    "skills": "sas"
  },
  {
    "job_id": 1332865,
    "job_title": "Junior Business Analyst",
    "salary_year_avg": "50000.0",
    "job_posted_date": "2023-08-10 14:01:22",
    "company_name": "Inspirus (a Pluxee company)",
    "skills": "excel"
  },
  {
    "job_id": 795187,
    "job_title": "Performance Analyst - Strategy",
    "salary_year_avg": "29900.0",
    "job_posted_date": "2023-12-26 11:16:30",
    "company_name": "Wiley",
    "skills": "spark"
  }
]
*/