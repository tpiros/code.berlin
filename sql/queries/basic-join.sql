SELECT e.name AS "Employee Name", e.salary, d.name AS "Department", d.location FROM employees e
INNER JOIN departments d
ON e.department = d.id