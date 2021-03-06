SELECT count(*) AS total_assignments, teachers.name AS name
FROM assistance_requests 
JOIN teachers ON teachers.id = assistance_requests.teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;