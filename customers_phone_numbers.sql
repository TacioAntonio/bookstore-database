-- Table - Customers_phone_numbers
CREATE TABLE customers_phone_numbers (
    phone_number VARCHAR(20) PRIMARY KEY NOT NULL,
    customer_id INT NOT NULL,
    CONSTRAINT constraint_customer_phone_number_format CHECK (
        phone_number REGEXP '^[+][0-9]{2} \\([0-9]{2}\\) [0-9]{4}-[0-9]{4}$'
    ),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Index - Customers_phone_numbers
CREATE INDEX idx_customers_phone_numbers ON customers_phone_numbers(phone_number);
SHOW INDEX FROM customers_phone_numbers;

-- Select - Customers_phone_numbers
SELECT * FROM customers_phone_numbers;