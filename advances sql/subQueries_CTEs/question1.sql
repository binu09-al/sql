/*
    Identify the top 5 skills that are most frequently mentioned in job postings. Use a subquery to find the skill IDs with the highest counts in the `skills_job_dim` table and then join this result with the `skills_dim` table to get the skill names.

*/

SELECT
    skills_dim.skills AS skills_name,
    top_skills.skills_count

FROM (
    SELECT
        skill_id,
        COUNT (skill_id) AS skills_count
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY COUNT(skill_id) DESC
    LIMIT 5
) AS top_skills

JOIN
    skills_dim ON top_skills.skill_id = skills_dim.skill_id

ORDER BY
    top_skills.skills_count DESC;