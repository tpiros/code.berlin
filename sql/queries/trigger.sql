DELIMITER $$
CREATE TRIGGER verifyAge
BEFORE INSERT ON sample
	FOR EACH ROW BEGIN
		IF (NEW.age < 18) THEN
			SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Error, age less than 18';
		END IF;
END$$

DELIMITER ;

-- Display triggers
SHOW TRIGGERS;

-- Drop Trigger
DROP TRIGGER verifyAge;

-- Test triggers
INSERT INTO sample VALUES ('Jack', 17, 0);
INSERT INTO sample VALUES ('Adam', 22, 1);
SELECT * FROM sample;