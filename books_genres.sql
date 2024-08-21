-- Table - Books_genres
CREATE TABLE books_genres (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	genre VARCHAR(20) NOT NULL,
    book_isbn VARCHAR(20) NOT NULL,
    FOREIGN KEY (book_isbn) REFERENCES books(ISBN)
);

-- Index - Books_genres
CREATE INDEX idx_books_genres ON books_genres(id);
SHOW INDEX FROM books_genres;

-- Select - Books_genres
SELECT * FROM books_genres;
