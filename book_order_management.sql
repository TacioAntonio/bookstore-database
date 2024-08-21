-- Table - Book_order_management
CREATE TABLE book_order_management (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	request_date DATE NOT NULL,
    order_status ENUM('Order placed', 'Order in progress', 'Order delivered'),
    quantity_demanded INT NOT NULL,
    supplier_id INT NOT NULL,
    book_isbn VARCHAR(20) NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
    FOREIGN KEY (book_isbn) REFERENCES books(ISBN)
);

-- Index - Book_order_management
CREATE INDEX idx_book_order_management ON book_order_management(id);
SHOW INDEX FROM book_order_management;

-- Trigger - Update stock when status is order delivered
DELIMITER $$
CREATE TRIGGER after_order_update
AFTER UPDATE ON book_order_management
FOR EACH ROW
BEGIN
    -- Verifica se o status do pedido foi alterado para "Order delivered"
    IF NEW.order_status = 'Order delivered' AND OLD.order_status <> 'Order delivered' THEN
        -- Verifica se o livro já está no estoque
        IF EXISTS (SELECT 1 FROM stock WHERE ISBN = NEW.book_isbn) THEN
            -- Atualiza o estoque existente
            UPDATE stock
            SET total_amount = total_amount + NEW.quantity_demanded,
                update_date = NOW()
            WHERE ISBN = NEW.book_isbn;
        ELSE
            -- Insere um novo registro no estoque
            INSERT INTO stock (ISBN, total_amount, update_date)
            VALUES (NEW.book_isbn, NEW.quantity_demanded, NOW());
        END IF;
    END IF;
END$$
DELIMITER ;

-- Select - Book_order_management
SELECT * FROM book_order_management;