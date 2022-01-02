SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, sum(assistance_requests.completed_at-assistance_requests.started_at) as duration
FROM assistance_requests
JOIN teachers ON teachers.id = assistance_requests.teacher_id
JOIN students ON students.id = assistance_requests.student_id
JOIN assignments ON assignments.id = assistance_requests.assignment_id
GROUP BY students.name , teachers.name, assignments.name
ORDER BY duration ASC;