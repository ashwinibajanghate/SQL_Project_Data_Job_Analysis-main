/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

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
    salary_year_avg DESC

/*
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
SQL is leading with a bold count of 6.
Power BI follows closely with a bold count of 5.
Python is also highly sought after, with a bold count of 4.
Other skills like AWS/Azure, Oracle/MongoDB, DataBricks, and Excel show varying degrees of demand.

[
    {
        "job_id": 1041666,
        "company_name": "Bosch Group",
        "job_title": "Data Architect - Data Migration",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "oracle"
    },
    {
        "job_id": 1041666,
        "company_name": "Bosch Group",
        "job_title": "Data Architect - Data Migration",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "sap"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "sql"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "python"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "mongodb"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "mongo"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "mysql"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "postgresql"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "sql server"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "mongodb"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "azure"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "aws"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "redshift"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "oracle"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "spark"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "hadoop"
    },
    {
        "job_id": 954793,
        "company_name": "Bosch Group",
        "job_title": "Data Architect 2023",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "165000.0",
        "skills": "power bi"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "sql"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "python"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "nosql"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "scala"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "shell"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "databricks"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "aws"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "oracle"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "snowflake"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "spark"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "pandas"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "pyspark"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "airflow"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "kafka"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "unix"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "linux"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "power bi"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "jenkins"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "flow"
    },
    {
        "job_id": 283661,
        "company_name": "Srijan Technologies",
        "job_title": "Technical Data Architect - Healthcare",
        "job_location": "Gurugram, Haryana, India",
        "salary_year_avg": "165000.0",
        "skills": "gitlab"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "sql"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "python"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "scala"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "go"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "mongodb"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "no-sql"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "neo4j"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "mongodb"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "azure"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "databricks"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "aws"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "oracle"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "spark"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "hadoop"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "gdpr"
    },
    {
        "job_id": 406320,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "power bi"
    },
    {
        "job_id": 781346,
        "company_name": "Eagle Genomics Ltd",
        "job_title": "Data Architect",
        "job_location": "Hyderabad, Telangana, India",
        "salary_year_avg": "163782.0",
        "skills": "gdpr"
    },
    {
        "job_id": 325402,
        "company_name": "Deutsche Bank",
        "job_title": "Senior Business & Data Analyst",
        "job_location": "India",
        "salary_year_avg": "119250.0",
        "skills": "sql"
    },
    {
        "job_id": 325402,
        "company_name": "Deutsche Bank",
        "job_title": "Senior Business & Data Analyst",
        "job_location": "India",
        "salary_year_avg": "119250.0",
        "skills": "excel"
    },
    {
        "job_id": 325402,
        "company_name": "Deutsche Bank",
        "job_title": "Senior Business & Data Analyst",
        "job_location": "India",
        "salary_year_avg": "119250.0",
        "skills": "visio"
    },
    {
        "job_id": 325402,
        "company_name": "Deutsche Bank",
        "job_title": "Senior Business & Data Analyst",
        "job_location": "India",
        "salary_year_avg": "119250.0",
        "skills": "jira"
    },
    {
        "job_id": 325402,
        "company_name": "Deutsche Bank",
        "job_title": "Senior Business & Data Analyst",
        "job_location": "India",
        "salary_year_avg": "119250.0",
        "skills": "confluence"
    },
    {
        "job_id": 908967,
        "company_name": "ACA Group",
        "job_title": "Sr. Enterprise Data Analyst",
        "job_location": "India",
        "salary_year_avg": "118140.0",
        "skills": "sql"
    },
    {
        "job_id": 908967,
        "company_name": "ACA Group",
        "job_title": "Sr. Enterprise Data Analyst",
        "job_location": "India",
        "salary_year_avg": "118140.0",
        "skills": "azure"
    },
    {
        "job_id": 908967,
        "company_name": "ACA Group",
        "job_title": "Sr. Enterprise Data Analyst",
        "job_location": "India",
        "salary_year_avg": "118140.0",
        "skills": "excel"
    },
    {
        "job_id": 908967,
        "company_name": "ACA Group",
        "job_title": "Sr. Enterprise Data Analyst",
        "job_location": "India",
        "salary_year_avg": "118140.0",
        "skills": "power bi"
    },
    {
        "job_id": 908967,
        "company_name": "ACA Group",
        "job_title": "Sr. Enterprise Data Analyst",
        "job_location": "India",
        "salary_year_avg": "118140.0",
        "skills": "flow"
    },
    {
        "job_id": 601909,
        "company_name": "Bosch Group",
        "job_title": "Process and Data Analyst",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "111175.0",
        "skills": "sql"
    },
    {
        "job_id": 601909,
        "company_name": "Bosch Group",
        "job_title": "Process and Data Analyst",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "111175.0",
        "skills": "python"
    },
    {
        "job_id": 601909,
        "company_name": "Bosch Group",
        "job_title": "Process and Data Analyst",
        "job_location": "Bengaluru, Karnataka, India",
        "salary_year_avg": "111175.0",
        "skills": "sap"
    },
    {
        "job_id": 1781493,
        "company_name": "Freshworks",
        "job_title": "Data Analyst",
        "job_location": "Chennai, Tamil Nadu, India",
        "salary_year_avg": "111175.0",
        "skills": "excel"
    },
    {
        "job_id": 1781493,
        "company_name": "Freshworks",
        "job_title": "Data Analyst",
        "job_location": "Chennai, Tamil Nadu, India",
        "salary_year_avg": "111175.0",
        "skills": "tableau"
    },
    {
        "job_id": 1781493,
        "company_name": "Freshworks",
        "job_title": "Data Analyst",
        "job_location": "Chennai, Tamil Nadu, India",
        "salary_year_avg": "111175.0",
        "skills": "power bi"
    },
    {
        "job_id": 1781493,
        "company_name": "Freshworks",
        "job_title": "Data Analyst",
        "job_location": "Chennai, Tamil Nadu, India",
        "salary_year_avg": "111175.0",
        "skills": "powerpoint"
    }
]
*/