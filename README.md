# Introduction
📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_sql folder](./project_sql/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

It's packed with insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT
    job_id,
    name as company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%India' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
```
Here's the breakdown of the top paying Data Analyst jobs in 2023:
- **High Salary Potential:** The top 10 highest-paying Data Analyst roles offer annual salaries ranging from $111,000 to $177,000, demonstrating strong earning opportunities for experienced data professionals.
- **Data Architecture Roles Lead the Market:** Data Architect positions account for most of the highest-paying jobs, indicating that professionals with expertise in designing and managing enterprise data systems are among the most highly compensated.
- **Top Opportunities in Major Tech Hubs:** Leading companies such as ServiceNow, Bosch Group, Deutsche Bank, Upstox, and Poshmark are hiring primarily in Bengaluru, Hyderabad, Mumbai, Chennai, and Gurugram, highlighting these cities as key destinations for high-paying data careers.

![Top Paying Roles](SQL_Project_Data_Job_Analysis-main\assets\top10_paying_roles.png)

*Bar chart visualizing the average annual salaries of the top 10 highest-paying Data Analyst jobs in India (2023), generated from SQL query results by ChatGPT.* 

### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
WITH top_paying_jobs AS(
    SELECT
        job_id,
        name as company_name,
        job_title,
        job_location,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location LIKE '%India' AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC;
```
Here's a breakdown of the results for Skills Required in the Top 10 Highest-Paying Data Analyst Jobs:
- **SQL** is the most common skill, appearing in 6 of the top-paying jobs, making it the fundamental requirement for high-paying data analyst and data architect roles.
- **Cloud, database**, and **big data technologies** including **AWS, Azure, Oracle, Spark, MongoDB, Hadoop,** and **Databricks** appear frequently, showing that employers highly value candidates who can work with modern data platforms and large-scale data systems.
- **Python** and **Power BI** remain key complementary skills, indicating that the highest-paying positions require a combination of programming, analytics, visualization, and data engineering expertise rather than relying on a single technical skill.

![Skill for Top Paying Jobs](SQL_Project_Data_Job_Analysis-main\assets\top10_skill_paying_job.png)

*Bar chart visualizing the count of skills for the top 10 highest-paying Data Analyst jobs in India (2023), generated from SQL query results by ChatGPT.* 

### 3. In-Demand Skills for Data Analysts
This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%India' 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
Here's a breakdown of the results for the Most In-Demand Skills for Data Analysts:
- **SQL** is the most sought-after skill, appearing in 2,561 job postings, making it the fundamental requirement for Data Analyst roles.
- **Python** and **Excel** rank second and third, demonstrating that employers value a combination of programming expertise and spreadsheet-based analysis.
- **Tableau** and **Power BI** complete the top five, highlighting the increasing demand for data visualization and business intelligence skills to support data-driven decision-making.

| **Skill** | **Demand Count** |
| --------- | ---------------: |
| SQL       |            2,561 |
| Python    |            1,802 |
| Excel     |            1,718 |
| Tableau   |            1,346 |
| Power BI  |            1,043 |

*Table of Top 5 Most In-Demand Skills for Data Analyst Jobs (2023)*

### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```sql
SELECT
    skills_dim.skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
        job_title_short = 'Data Analyst' AND
        job_location LIKE '%India' AND
        salary_year_avg IS NOT NULL 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
Here's a breakdown of the results for Top Paying Skills for Data Analysts:
- **High Salaries for Big Data & Data Engineering Skills:** The highest-paying roles are associated with big data technologies such as PySpark, Spark, Hadoop, Kafka, and Databricks, indicating that expertise in processing large-scale data significantly increases earning potential.
- **Strong Demand for Database & Infrastructure Skills:** Skills like PostgreSQL, MySQL, MongoDB, Snowflake, Linux, and NoSQL highlight that organizations highly value analysts who can work with modern databases and data infrastructure.
- **Technical & Automation Skills Drive Higher Pay:** Proficiency in tools such as GitLab, Airflow, Bash, Shell, Pandas, and Scala demonstrates that employers offer premium salaries to analysts who can automate workflows and collaborate within engineering teams.

| **Skill**  | **Average Salary (USD)** |
| ---------- | -----------------------: |
| PySpark    |                 $165,000 |
| GitLab     |                 $165,000 |
| PostgreSQL |                 $165,000 |
| Linux      |                 $165,000 |
| MySQL      |                 $165,000 |
| Neo4j      |                 $163,782 |
| GDPR       |                 $163,782 |
| Airflow    |                 $138,088 |
| MongoDB    |                 $135,994 |
| Scala      |                 $135,994 |

*Table of the average salary for the Top 10 Highest-Paying Skills for Data Analyst Jobs*

### 5. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
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
    AND job_location LIKE '%India'
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC;
```
Here's a breakdown of the results for High Demand & High Paying Skills for Data Analysts:
- SQL, Python, and Excel dominate the job market, combining the highest demand with competitive salaries, making them the most valuable foundational skills for aspiring Data Analysts.
- Business Intelligence and cloud technologies, including Power BI, Tableau, Azure, and AWS, offer strong salary potential while remaining consistently in demand, highlighting the industry's growing focus on data visualization and cloud-based analytics.
- Specialized technical skills such as Spark and Oracle command the highest average salaries, indicating that expertise in big data processing and enterprise databases can significantly increase earning potential despite lower demand than core analytics skills.

| **Skill ID** | **Skills** | **Demand Count** | **Average Salary (USD)** |
| :------:     | ---------  | ---------------: | -----------------------: |
|     92       | Spark      |               11 |                 $118,332 |
|     183      | Power BI   |               17 |                 $109,832 |
|     79       | Oracle     |               11 |                 $104,260 |
|     74       | Azure      |               15 |                  $98,570 |
|     1        | Python     |               36 |                  $95,933 |
|     76       | AWS        |               12 |                  $95,333 |
|     182      | Tableau    |               20 |                  $95,103 |
|     0        | SQL        |               46 |                  $92,984 |
|     181      | Excel      |               39 |                  $88,519 |
|     5        | R          |               18 |                  $86,609 |

*Table of the most optimal skills for Data Analyst Jobs sorted by salary*

# What I learned
Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- 🧩 **Complex Query Crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
- 📊 **Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
- 💡 **Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions
### Insights

From the analysis, several general insights emerged:

1. **Top-Paying Data Analyst Jobs:** The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $177,000!
2. **Skills for Top-Paying Jobs:** High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
3. **Most In-Demand Skills:** SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Skills with Higher Salaries:** Specialized skills, such as big data technologies and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.
5. **Optimal Skills for Job Market Value:** SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.