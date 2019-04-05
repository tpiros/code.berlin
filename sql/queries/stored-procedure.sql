-- StoredProc without params
DELIMITER $$
CREATE PROCEDURE displayTopEarners()
	BEGIN
		SELECT e.name, e.salary, d.name FROM employees e
        INNER JOIN departments d
        ON e.department = d.id
        ORDER BY e.salary DESC
        LIMIT 10;
	END $$
DELIMITER ;

-- Stored proc with params

DELIMITER $$
CREATE PROCEDURE displayTopEarners(IN dept VARCHAR(20), IN ord VARCHAR(4))
	BEGIN
		SELECT e.name, e.salary, d.name FROM employees e
        INNER JOIN departments d
        ON e.department = d.id
        WHERE d.name = dept
        ORDER BY CASE WHEN ord = 'ASC' THEN e.salary END ASC,
							CASE WHEN ord ='DESC' THEN e.salary END DESC
        LIMIT 10;
	END $$
DELIMITER ;

-- Call Stored Proc
CALL displayTopEarners('Legal', 'ASC');

-- Drop Stored Proc
DROP PROCEDURE displayTopEarners 

-- Display Stored Procs
SHOW PROCEDURE STATUS;