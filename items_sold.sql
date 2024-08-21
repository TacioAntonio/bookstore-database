-- Table - Items_sold
CREATE TABLE items_sold (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	amount INT NOT NULL,
    unit_price DECIMAL(7, 2) NOT NULL,
    sale_made_id INT NOT NULL,
    book_isbn VARCHAR(20) NOT NULL,
    FOREIGN KEY (sale_made_id) REFERENCES sales_made(id),
    FOREIGN KEY (book_isbn) REFERENCES books(ISBN)
);

-- Index - Items_sold
CREATE INDEX idx_items_sold ON items_sold(id);
SHOW INDEX FROM items_sold;

-- Trigger - Automatically update the unit_price column before an insertion into items_sold according to the price in the books
DELIMITER //
CREATE TRIGGER set_unit_price
BEFORE INSERT ON items_sold
FOR EACH ROW
BEGIN
    DECLARE book_price DECIMAL(10,2);

    -- Buscar o preço do livro na tabela 'books' baseado no 'book_isbn'
    SELECT price INTO book_price
    FROM books
    WHERE isbn = NEW.book_isbn;

    -- Definir o 'unit_price' da nova linha como o preço do livro
    SET NEW.unit_price = book_price;
END; $$
DELIMITER ;

-- Trigger - Before making a sale, check if the item is in stock
DELIMITER //
CREATE TRIGGER check_stock_before_insert_or_update
BEFORE INSERT ON items_sold
FOR EACH ROW
BEGIN
    DECLARE stock_amount INT;

    -- Verifica a quantidade disponível em estoque para o item específico
    SELECT total_amount INTO stock_amount
    FROM stock
    WHERE ISBN = NEW.book_isbn;

    -- Se a quantidade desejada for maior que a disponível, lança um erro
    IF NEW.amount > stock_amount THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Desired quantity greater than quantity in stock.';
    END IF;
END; //
DELIMITER ;

-- Trigger - Update total_value in sales_made
-- INSERT
DELIMITER //
CREATE TRIGGER update_sales_total
AFTER INSERT ON items_sold
FOR EACH ROW
BEGIN
    DECLARE total DECIMAL(10, 2);

    -- Calcular o total de todos os itens associados ao mesmo sale_made_id
    SELECT SUM(amount * unit_price) INTO total
    FROM items_sold
    WHERE sale_made_id = NEW.sale_made_id;

    -- Atualizar o valor total da venda na tabela sales_made
    UPDATE sales_made
    SET total_value = total
    WHERE id = NEW.sale_made_id;
END; //
DELIMITER ;

-- UPDATE
DELIMITER //
CREATE TRIGGER update_sales_total_after_update
AFTER UPDATE ON items_sold
FOR EACH ROW
BEGIN
    DECLARE total DECIMAL(10, 2);

    -- Recalcular o total de todos os itens associados ao mesmo sale_made_id
    SELECT SUM(amount * unit_price) INTO total
    FROM items_sold
    WHERE sale_made_id = NEW.sale_made_id;

    -- Atualizar o valor total da venda na tabela sales_made
    UPDATE sales_made
    SET total_value = total
    WHERE id = NEW.sale_made_id;
END; //
DELIMITER ;

-- DELETE
DELIMITER //
CREATE TRIGGER update_sales_total_after_delete
AFTER DELETE ON items_sold
FOR EACH ROW
BEGIN
    DECLARE total_sales DECIMAL(10, 2);

    -- Calcula o novo total de vendas para o sale_made_id relacionado
    SELECT IFNULL(SUM(amount * unit_price), 0) INTO total_sales
    FROM items_sold
    WHERE sale_made_id = OLD.sale_made_id;

    -- Atualiza o total de vendas na tabela sales_made
    UPDATE sales_made
    SET total_value = total_sales
    WHERE id = OLD.sale_made_id;
END; //
DELIMITER ;

-- Trigger - Show triggers
SHOW TRIGGERS FROM bookstore;

-- Select - Items_sold
SELECT * FROM items_sold;