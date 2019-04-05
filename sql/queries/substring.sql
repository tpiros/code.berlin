SET SQL_SAFE_UPDATES = 0; 
UPDATE employees e1 SET e1.salary = 
(
	SELECT CONVERT(SUBSTRING_INDEX(SUBSTRING_INDEX(salary,'£',-1), '.', 1), UNSIGNED INT)
    AS num
	FROM (SELECT * FROM employees) AS e2
	WHERE e1.id = e2.id
);
SET SQL_SAFE_UPDATES = 1;

-- And don't forget to change the datatype for the table
ALTER TABLE employees MODIFY salary INT;