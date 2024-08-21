-- Table - Authors_emails
CREATE TABLE authors_emails (
    email VARCHAR(50) PRIMARY KEY NOT NULL,
    author_id INT NOT NULL,
    CONSTRAINT constraint_author_email_format CHECK (
        email REGEXP '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$'
    ),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- Index - Authors_emails
CREATE INDEX idx_authors_emails ON authors_emails(email);
SHOW INDEX FROM authors_emails;

-- Select - Authors_emails
SELECT * FROM authors_emails;