-- Table - Link_stock_books
CREATE TABLE link_stock_books (
	stock_isbn VARCHAR(20) NOT NULL,
    book_isbn VARCHAR(20) NOT NULL,
    FOREIGN KEY (stock_isbn) REFERENCES stock(ISBN),
    FOREIGN KEY (book_isbn) REFERENCES books(ISBN)
);

-- Index - Link_stock_books
CREATE INDEX stock_isbnx_link_stock_books ON link_stock_books(stock_isbn);
CREATE INDEX book_isbnx_link_stock_books ON link_stock_books(book_isbn);
SHOW INDEX FROM link_stock_books;

-- Select - Link_stock_books
SELECT * FROM link_stock_books;