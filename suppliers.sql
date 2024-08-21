-- Table - Suppliers
CREATE TABLE suppliers (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    public_place VARCHAR(50) NOT NULL,
	residence_number VARCHAR(20) NOT NULL,
	zip_code VARCHAR(20) NOT NULL
);

-- Index - Suppliers
CREATE INDEX idx_suppliers ON suppliers(id);
SHOW INDEX FROM suppliers;

-- Select - Suppliers
SELECT * FROM suppliers;