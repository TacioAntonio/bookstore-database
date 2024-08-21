-- Table - Employees
CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    public_place VARCHAR(50) NOT NULL,
	residence_number VARCHAR(20) NOT NULL,
	zip_code VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    job_title VARCHAR(10) NOT NULL,
	salary DECIMAL(7, 2) NOT NULL
);

-- Index - Employees
CREATE INDEX idx_employees ON employees(id);
SHOW INDEX FROM employees;

-- Trigger - Check if you are over 18 years old
DELIMITER $$
CREATE TRIGGER check_age_employees
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    IF TIMESTAMPDIFF(YEAR, NEW.date_of_birth, CURDATE()) < 18 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'The customer must be at least 18 years old.';
    END IF;
END; $$
DELIMITER ;

-- Trigger - Show triggers
SHOW TRIGGERS FROM bookstore;

-- Select - Employees
SELECT * FROM employees;