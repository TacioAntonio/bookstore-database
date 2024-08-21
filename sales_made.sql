-- Table - Sales_made
CREATE TABLE sales_made (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    total_value DECIMAL(10,2) DEFAULT NULL,
    date_sale_made DATE NOT NULL,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

-- Index - Sales_made
CREATE INDEX idx_sales_made ON sales_made(id);
SHOW INDEX FROM sales_made;

-- Select - Sales_made
SELECT * FROM sales_made;