-- Table - Customers
CREATE TABLE customers (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    public_place VARCHAR(50) NOT NULL,
	residence_number VARCHAR(20) NOT NULL,
	zip_code VARCHAR(20) NOT NULL,
    date_of_birth DATE NOT NULL
);

-- Index - Customers
CREATE INDEX idx_customer ON customers(id);
SHOW INDEX FROM customers;

-- Trigger - Check if you are over 18 years old
DELIMITER $$
CREATE TRIGGER check_age_customers
AFTER INSERT ON customers
FOR EACH ROW
BEGIN
    IF TIMESTAMPDIFF(YEAR, NEW.date_of_birth, CURDATE()) < 18 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'The customer must be at least 18 years old.';
    END IF;
END; $$
DELIMITER ;

-- Select - Customers
SELECT * FROM customers;