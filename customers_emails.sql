-- Table - Customers_emails
CREATE TABLE customers_emails (
    email VARCHAR(50) PRIMARY KEY NOT NULL,
    customer_id INT NOT NULL,
    CONSTRAINT constraint_customer_email_format CHECK (
        email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'
    ),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Index - Customers_emails
CREATE INDEX idx_customers_emails ON customers_emails(email);
SHOW INDEX FROM customers_emails;

-- Select - Customers_emails
SELECT * FROM customers_emails;