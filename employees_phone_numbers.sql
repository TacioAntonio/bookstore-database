-- Table - Employees_phone_numbers
CREATE TABLE employees_phone_numbers (
    phone_number VARCHAR(20) PRIMARY KEY NOT NULL,
    employee_id INT NOT NULL,
    CONSTRAINT constraint_employee_phone_number_format CHECK (
        phone_number REGEXP '^[+][0-9]{2} \\([0-9]{2}\\) [0-9]{4}-[0-9]{4}$'
    ),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

-- Index - Employees_phone_numbers
CREATE INDEX idx_employees_phone_numbers ON employees_phone_numbers(phone_number);
SHOW INDEX FROM employees_phone_numbers;

-- Select - Employees_phone_numbers
SELECT * FROM employees_phone_numbers;