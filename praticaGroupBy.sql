-- Questão 1
SELECT COUNT ("endDate") as "currentExperiences" 
FROM experiences;

-- Questão 2
SELECT "userId" AS id, COUNT ("userId") AS educations
FROM educations
GROUP BY "userId";

-- Questão 3
SELECT users.name AS writer, 
COUNT(testimonials."writerId") as testimonailCount
FROM testimonials
JOIN users
ON testimonials."writerId" = users.id
WHERE users.id = 435
GROUP BY users.name;

-- Questão 4
SELECT MAX(jobs.salary) AS "maximumSalary", roles.name AS role
FROM jobs
JOIN roles
ON jobs."roleId" = roles.id
WHERE jobs.active = true
GROUP BY role
ORDER BY "maximumSalary";

-- BÔNUS
SELECT schools.name AS school, courses.name AS course, 
COUNT(educations.id) AS "studentsCount", educations.status AS role
FROM courses
JOIN educations
ON courses.id = educations."courseId"
JOIN schools
ON educations."schoolId" = schools.id
WHERE educations.status = 'ongoing' 
OR educations.status = 'finished'
GROUP BY schools.name, courses.name, educations.status
ORDER BY "studentsCount" DESC
LIMIT 3;