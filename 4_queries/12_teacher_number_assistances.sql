SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, count(*) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY cohort, teacher
ORDER BY teacher;


ALTER TABLE users
ADD COLUMN nmember_since TIMESTAMP NOT NULL DEFAULT Now();