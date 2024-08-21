SELECT 
sales_made.id, sales_made.customer_id, sales_made.employee_id, sales_made.total_value,
items_sold.sale_made_id, items_sold.amount, items_sold.unit_price, items_sold.book_isbn,
employees.id, employees.full_name
FROM sales_made
INNER JOIN items_sold ON items_sold.sale_made_id = sales_made.id
INNER JOIN employees ON employees.id = sales_made.employee_id;

SELECT employees.residence_number, SUM(salary) 
FROM employees GROUP BY residence_number;