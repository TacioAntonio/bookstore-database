-- Table - Books
CREATE TABLE books (
	ISBN VARCHAR(20) PRIMARY KEY NOT NULL,
	title VARCHAR(100) NOT NULL,
    year_publication DATE NOT NULL,
    publishing_company VARCHAR(100) NOT NULL,
    price DECIMAL(7,2) NOT NULL
);

-- Index - Books
CREATE INDEX idx_books ON books(ISBN);
SHOW INDEX FROM books;

-- Select - Books
SELECT * FROM books;