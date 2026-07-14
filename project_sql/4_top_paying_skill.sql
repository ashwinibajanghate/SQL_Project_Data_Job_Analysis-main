/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

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
LIMIT 25

/*
Here's a breakdown of the results for Top Paying Skills for Data Analysts:
- High Salaries for Big Data & Data Engineering Skills: The highest-paying roles are associated with big data technologies such as PySpark, Spark, Hadoop, Kafka, and Databricks, indicating that expertise in processing large-scale data significantly increases earning potential.
- Strong Demand for Database & Infrastructure Skills: Skills like PostgreSQL, MySQL, MongoDB, Snowflake, Linux, and NoSQL highlight that organizations highly value analysts who can work with modern databases and data infrastructure.
- Technical & Automation Skills Drive Higher Pay: Proficiency in tools such as GitLab, Airflow, Bash, Shell, Pandas, and Scala demonstrates that employers offer premium salaries to analysts who can automate workflows and collaborate within engineering teams.

[
    {
        "skills": "pyspark",
        "avg_salary": "165000"
    },
    {
        "skills": "gitlab",
        "avg_salary": "165000"
    },
    {
        "skills": "postgresql",
        "avg_salary": "165000"
    },
    {
        "skills": "linux",
        "avg_salary": "165000"
    },
    {
        "skills": "mysql",
        "avg_salary": "165000"
    },
    {
        "skills": "neo4j",
        "avg_salary": "163782"
    },
    {
        "skills": "gdpr",
        "avg_salary": "163782"
    },
    {
        "skills": "airflow",
        "avg_salary": "138088"
    },
    {
        "skills": "mongodb",
        "avg_salary": "135994"
    },
    {
        "skills": "scala",
        "avg_salary": "135994"
    },
    {
        "skills": "databricks",
        "avg_salary": "135994"
    },
    {
        "skills": "pandas",
        "avg_salary": "122463"
    },
    {
        "skills": "kafka",
        "avg_salary": "122100"
    },
    {
        "skills": "confluence",
        "avg_salary": "119250"
    },
    {
        "skills": "visio",
        "avg_salary": "119250"
    },
    {
        "skills": "shell",
        "avg_salary": "118500"
    },
    {
        "skills": "spark",
        "avg_salary": "118332"
    },
    {
        "skills": "jira",
        "avg_salary": "115213"
    },
    {
        "skills": "no-sql",
        "avg_salary": "114291"
    },
    {
        "skills": "hadoop",
        "avg_salary": "113276"
    },
    {
        "skills": "snowflake",
        "avg_salary": "111213"
    },
    {
        "skills": "matplotlib",
        "avg_salary": "111175"
    },
    {
        "skills": "dax",
        "avg_salary": "111175"
    },
    {
        "skills": "bash",
        "avg_salary": "111175"
    },
    {
        "skills": "electron",
        "avg_salary": "111175"
    }
]
*/