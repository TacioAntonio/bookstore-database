-- Table - Link_books_authors
CREATE TABLE link_books_authors (
	author_id INT NOT NULL,
    book_isbn VARCHAR(20) NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (book_isbn) REFERENCES books(ISBN)
);

-- Index - Link_books_authors
CREATE INDEX author_idx_link_books_authors ON link_books_authors(author_id);
CREATE INDEX book_isbnx_link_books_authors ON link_books_authors(book_isbn);
SHOW INDEX FROM link_books_authors;

-- Select - Link_books_authors
SELECT * FROM link_books_authors;