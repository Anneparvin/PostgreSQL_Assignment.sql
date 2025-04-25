-- Active: 1745148769683@@127.0.0.1@5432@postgres@public

-- Create the books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    price NUMERIC(8, 2) CHECK (price >= 0),
    stock INT CHECK (stock >= 0),
    published_year INT
);


-- Insert sample data into books table
INSERT INTO books (id, title, author, price, stock, published_year) VALUES
(1, 'The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
(2, 'Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
(3, 'You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
(4, 'Refactoring', 'Martin Fowler', 50.00, 3, 1999),
(5, 'Database Design Principles', 'Jane Smith', 20.00, 0, 2018);


-- Create the customers table
 CREATE TABLE customers (
 id SERIAL PRIMARY KEY,
 name VARCHAR(255) NOT NULL,
 email VARCHAR(255) UNIQUE NOT NULL,
 joined_date DATE DEFAULT CURRENT_DATE
);


-- Insert sample data into customers table
INSERT INTO customers (id, name, email, joined_date) VALUES
(1, 'Alice', 'alice@email.com', '2023-01-10'),
(2, 'Bob', 'bob@email.com', '2022-05-15'),
(3, 'Charlie', 'charlie@email.com', '2023-06-20');


-- Create the orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT CHECK (quantity > 0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- Insert sample data into orders table
INSERT INTO orders (id, customer_id, book_id, quantity, order_date) VALUES
(1, 1, 2, 1, '2024-03-10'),
(2, 2, 1, 1, '2024-02-20'),
(3, 1, 3, 2, '2024-03-05');



-- 1.Query to find books that are out of stock
SELECT title
from books
WHERE stock = 0;


-- 2.Query to find the most expensive book
SELECT * 
FROM books 
WHERE price = (SELECT MAX(price) FROM books);


-- 3.Query to calculate total revenue from book sales
SELECT c.name, COUNT(o.id) AS total_orders
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name;



-- 4.Query to calculate the average price of books in the store
SELECT SUM(b.price * o.quantity) AS total_revenue
FROM orders o
JOIN books b ON o.book_id = b.id;

-- 5.Query to list customers who placed more than one order
SELECT c.name, COUNT(o.id) AS orders_count
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
HAVING COUNT(o.id) > 1;


-- 6.Query to Find the average price of books in the store
SELECT ROUND(AVG(price), 2) AS avg_book_price 
FROM books;


-- 7.Update query to increase the price of books published before 2000 by 10%
UPDATE books
SET price = CASE 
    WHEN id = 1 THEN 40.00
    WHEN id = 2 THEN 35.00
    WHEN id = 3 THEN 30.00
    WHEN id = 4 THEN 50.00
    WHEN id = 5 THEN 20.00
END
WHERE id IN (1, 2, 3, 4, 5);



-- 8.Delete customers who have not placed any orders
DELETE FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.id
)

