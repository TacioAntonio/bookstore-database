-- Table - Suppliers_emails
CREATE TABLE suppliers_emails (
    email VARCHAR(50) PRIMARY KEY NOT NULL,
    supplier_id INT NOT NULL,
    CONSTRAINT constraint_supplier_email_format CHECK (
        email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'
    ),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

-- Index - Suppliers_emails
CREATE INDEX idx_suppliers_emails ON suppliers_emails(email);
SHOW INDEX FROM suppliers_emails;

-- Select - Suppliers_emails
SELECT * FROM suppliers_emails;