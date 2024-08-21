-- Table - Authors_phone_numbers
CREATE TABLE authors_phone_numbers (
    phone_number VARCHAR(20) PRIMARY KEY NOT NULL,
    author_id INT NOT NULL,
    CONSTRAINT constraint_author_phone_number_format CHECK (
        phone_number REGEXP '^[+][0-9]{2} \\([0-9]{2}\\) [0-9]{4}-[0-9]{4}$'
    ),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- Index - Authors_phone_numbers
CREATE INDEX idx_authors_phone_numbers ON authors_phone_numbers(phone_number);
SHOW INDEX FROM authors_phone_numbers;

-- Select - Authors_phone_numbers
SELECT * FROM authors_phone_numbers;