
# **Business Analyst Skills and Job Analysis Project**

---

## **Introduction**

Welcome to my SQL Portfolio Project, where I analyze the 2023 Business Analyst job market. This project explores:
- Top-paying roles and the skills they require.
- The most in-demand skills for Business Analysts.
- The intersection of high-demand and high-salary skills for career optimization.

This README provides an overview of the SQL queries, insights, and visualizations generated from the project.

---

## **Background**

This project aims to uncover valuable insights into the Business Analyst job market. By analyzing job postings and associated skills, it answers critical questions such as:
1. What are the top-paying Business Analyst roles?
2. What skills are required for these roles?
3. What are the most in-demand skills for Business Analysts?
4. Which skills command the highest salaries?
5. What are the most optimal skills for a Business Analyst to learn?

### **Data Source**
The dataset is inspired by simulated job market data, which includes:
- **Job Titles**: Detailed role descriptions.
- **Salaries**: Annual averages for each position.
- **Skills**: Technical and non-technical skills required.

---

## **Tools Used**

### **Primary Tools**
- **SQL**: To query and analyze data.
- **PostgreSQL**: For data storage and management.
- **Visual Studio Code**: For managing SQL scripts and database connections.
- **Python (Matplotlib)**: To create insightful visualizations of the data.

---

## **Analysis**

### **1. Top Paying Business Analyst Roles**

**Objective:** Identify roles offering the highest salaries.

**SQL Query:**
```sql
SELECT
    job_title,
    salary_year_avg,
    job_location,
    job_posted_date
FROM
    job_postings_fact
WHERE
    job_title_short = 'Business Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```

---

### **2. Skills for Top Paying Jobs**

**Objective:** Determine the skills required for top-paying roles.

**SQL Query:**
```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact
    WHERE
        job_title_short = 'Business Analyst'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT
    top_paying_jobs.job_title,
    skills_dim.skills,
    top_paying_jobs.salary_year_avg
FROM
    top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id;
```

---

### **3. Most In-Demand Skills**

**Objective:** Identify skills mentioned most frequently in job postings.

**SQL Query:**
```sql
SELECT
    skills_dim.skills,
    COUNT(*) AS frequency
FROM
    skills_dim
    JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
GROUP BY
    skills_dim.skills
ORDER BY
    frequency DESC
LIMIT 10;
```

---

### **4. Skills Based on Salary**

**Objective:** Discover which skills are associated with higher salaries.

**SQL Query:**
```sql
SELECT
    skills_dim.skills AS skill,
    AVG(job_postings_fact.salary_year_avg) AS avg_salary
FROM
    skills_dim
    JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
GROUP BY
    skills_dim.skills
ORDER BY
    avg_salary DESC;
```

---

### **5. Most Optimal Skills**

**Objective:** Identify skills that are both in high demand and command high salaries.

**SQL Query:**
```sql
WITH skill_demand AS (
    SELECT
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM
        skills_dim
        JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    GROUP BY
        skills_dim.skills
),
skill_salary AS (
    SELECT
        skills_dim.skills,
        AVG(job_postings_fact.salary_year_avg) AS avg_salary
    FROM
        skills_dim
        JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
        JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
    GROUP BY
        skills_dim.skills
)
SELECT
    skill_demand.skills,
    skill_demand.demand_count,
    ROUND(skill_salary.avg_salary, 2) AS avg_salary
FROM
    skill_demand
    JOIN skill_salary ON skill_demand.skills = skill_salary.skills
ORDER BY
    demand_count DESC, avg_salary DESC
LIMIT 10;
```

---

## **Visual Insights**

### **Top Skills by Frequency**
![Top Skills by Frequency](attachment:image.png)

### **Top Paying Skills**
![Top Paying Skills](attachment:image.png)

---

## **Insights**

### **Key Findings**
1. **Top Paying Roles**: High-paying roles like **Chef ($220,000)** and **Phoenix ($135,990)** highlight niche expertise in automation and frameworks.
2. **Most In-Demand Skills**: Foundational tools like **SQL** and **Excel** dominate job postings, with emerging tools like **Smartsheet** gaining traction.
3. **Optimal Skills**: Tools like **Python**, **Snowflake**, and **GCP** offer a blend of high pay and demand, making them essential for career growth.

---

## **Conclusion**

This project highlights the skills and roles shaping the 2023 Business Analyst job market. By focusing on high-demand and high-paying skills, professionals can better position themselves for success. SQL proved invaluable for uncovering actionable insights, and the visualizations provide a clear understanding of market trends.

For access to the SQL scripts, visit the project repository: [Your Repository Link]. 

---
