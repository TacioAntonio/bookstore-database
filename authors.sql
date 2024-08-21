-- Table - Authors
CREATE TABLE authors (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    public_place VARCHAR(50) NOT NULL,
	residence_number VARCHAR(20) NOT NULL,
	zip_code VARCHAR(20) NOT NULL
);

-- Index - Authors
CREATE INDEX idx_author ON authors(id);
SHOW INDEX FROM authors;

-- Select - Authors
SELECT * FROM authors;