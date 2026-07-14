/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

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
LIMIT 5

/*
Here's a breakdown of the results for the Most In-Demand Skills for Data Analysts:
- SQL is the most sought-after skill, appearing in 2,561 job postings, making it the fundamental requirement for Data Analyst roles.
- Python and Excel rank second and third, demonstrating that employers value a combination of programming expertise and spreadsheet-based analysis.
- Tableau and Power BI complete the top five, highlighting the increasing demand for data visualization and business intelligence skills to support data-driven decision-making.

[
    {
        "skills": "sql",
        "demand_count": "2561"
    },
    {
        "skills": "python",
        "demand_count": "1802"
    },
    {
        "skills": "excel",
        "demand_count": "1718"
    },
    {
        "skills": "tableau",
        "demand_count": "1346"
    },
    {
        "skills": "power bi",
        "demand_count": "1043"
    }
]
*/