/* What are the top skills based on salary?
- Loook at the average salary associated with each skill for Data Analyst positions. 
- Focuses on roles with specified salaries, regardless of location. 
- Why? It reveals how different skills impact salary levels for Business Analysts and helps identify
the most financially rewarding skills to aquire or improve. 
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON
    job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY
    skills
ORDER BY
   average_salary DESC
LIMIT 25;

/*
1. Cloud and AI Skills Lead Salaries: Tools like Chef ($220K), Looker ($130K), BigQuery, and GCP (~$115K) showcase the dominance of cloud, AI, and automation in high-paying roles.
2. Programming and Data Expertise Pay Well: Python ($116K), R ($114K), and Snowflake ($114K) emphasize the importance of programming and modern data platforms.
3. Traditional Tools Remain Relevant: BI tools like Tableau ($104K) and Qlik ($110K), alongside presentation tools like Word and PowerPoint (~$101K), retain value in business analysis.

[
  {
    "skills": "chef",
    "average_salary": "220000"
  },
  {
    "skills": "phoenix",
    "average_salary": "135990"
  },
  {
    "skills": "looker",
    "average_salary": "130400"
  },
  {
    "skills": "mongodb",
    "average_salary": "120000"
  },
  {
    "skills": "python",
    "average_salary": "116516"
  },
  {
    "skills": "bigquery",
    "average_salary": "115833"
  },
  {
    "skills": "gcp",
    "average_salary": "115833"
  },
  {
    "skills": "r",
    "average_salary": "114629"
  },
  {
    "skills": "snowflake",
    "average_salary": "114500"
  },
  {
    "skills": "db2",
    "average_salary": "114500"
  },
  {
    "skills": "ssrs",
    "average_salary": "111500"
  },
  {
    "skills": "nosql",
    "average_salary": "110490"
  },
  {
    "skills": "qlik",
    "average_salary": "110175"
  },
  {
    "skills": "elasticsearch",
    "average_salary": "110000"
  },
  {
    "skills": "mxnet",
    "average_salary": "110000"
  },
  {
    "skills": "tensorflow",
    "average_salary": "110000"
  },
  {
    "skills": "databricks",
    "average_salary": "110000"
  },
  {
    "skills": "node.js",
    "average_salary": "110000"
  },
  {
    "skills": "chainer",
    "average_salary": "110000"
  },
  {
    "skills": "pytorch",
    "average_salary": "110000"
  },
  {
    "skills": "visio",
    "average_salary": "106250"
  },
  {
    "skills": "tableau",
    "average_salary": "104233"
  },
  {
    "skills": "hadoop",
    "average_salary": "101993"
  },
  {
    "skills": "word",
    "average_salary": "101250"
  },
  {
    "skills": "powerpoint",
    "average_salary": "100800"
  }
]
*/