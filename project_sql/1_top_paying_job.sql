/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

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

/*
Here's the breakdown of the top paying Data Analyst jobs in 2023:
- High Salary Potential: The top 10 highest-paying Data Analyst roles offer annual salaries ranging from $111,000 to $177,000, demonstrating strong earning opportunities for experienced data professionals.
- Data Architecture Roles Lead the Market: Data Architect positions account for most of the highest-paying jobs, indicating that professionals with expertise in designing and managing enterprise data systems are among the most highly compensated.
- Top Opportunities in Major Tech Hubs: Leading companies such as ServiceNow, Bosch Group, Deutsche Bank, Upstox, and Poshmark are hiring primarily in Bengaluru, Hyderabad, Mumbai, Chennai, and Gurugram, highlighting these cities as key destinations for high-paying data careers.
*/