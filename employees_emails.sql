-- Table - Employees_emails
CREATE TABLE employees_emails (
    email VARCHAR(50) PRIMARY KEY NOT NULL,
    employee_id INT NOT NULL,
    CONSTRAINT constraint_employee_email_format CHECK (
        email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'
    ),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

-- Index - Employees_emails
CREATE INDEX idx_employees_emails ON employees_emails(email);
SHOW INDEX FROM employees_emails;

-- Select - Employees_emails
SELECT * FROM employees_emails;