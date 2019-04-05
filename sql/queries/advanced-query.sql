-- Average salary per department
SELECT d.name, AVG(e.salary)
FROM departments d
JOIN employees e
ON (e.department = d.id)
GROUP BY d.name
ORDER BY d.name;

-- Salaries ordered by value, for a specific department
SELECT e.name, e.salary, d.name FROM employees e
JOIN departments d
ON e.department = d.id
WHERE d.name = 'HR'
ORDER BY e.salary DESC;

-- Average salary, less than 140k per department, rounded
SELECT ROUND(AVG(e.salary)) AS avg_salary, d.name FROM employees e
JOIN departments d
ON e.department = d.id
GROUP BY d.name;
HAVING AVG(e.salary) < 140000
ORDER BY avg_salary