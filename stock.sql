-- Table - Stock
CREATE TABLE stock (
	ISBN VARCHAR(20) PRIMARY KEY NOT NULL,
    total_amount INT NOT NULL,
    update_date DATE NOT NULL
);

-- Index - Stock
CREATE INDEX idx_stock ON stock(ISBN);
SHOW INDEX FROM stock;

-- Trigger - Updates the quantity in stock by subtracting the quantity sold
DELIMITER //
CREATE TRIGGER update_stock_after_insert
AFTER INSERT ON items_sold
FOR EACH ROW
BEGIN
    -- Atualiza a quantidade em estoque subtraindo a quantidade vendida
    UPDATE stock
    SET total_amount = total_amount - NEW.amount
    WHERE isbn = NEW.book_isbn;

    -- Verifica se o estoque se tornou negativo
    IF (SELECT total_amount FROM stock WHERE isbn = NEW.book_isbn) < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Insufficient quantity in stock for the book sold.';
    END IF;
END; //
DELIMITER ;

-- Select - Stock
SELECT * FROM stock;