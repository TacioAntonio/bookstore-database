-- Table - Suppliers_phone_numbers
CREATE TABLE suppliers_phone_numbers (
    phone_number VARCHAR(20) PRIMARY KEY NOT NULL,
    supplier_id INT NOT NULL,
    CONSTRAINT constraint_supplier_phone_number_format CHECK (
        phone_number REGEXP '^[+][0-9]{2} \\([0-9]{2}\\) [0-9]{4}-[0-9]{4}$'
    ),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

-- Index - Suppliers_phone_numbers
CREATE INDEX idx_suppliers_phone_numbers ON suppliers_phone_numbers(phone_number);
SHOW INDEX FROM suppliers_phone_numbers;

-- Select - Suppliers_phone_numbers
SELECT * FROM suppliers_phone_numbers;