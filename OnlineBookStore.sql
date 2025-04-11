CREATE DATABASE OnlineBookstore;
USE OnlineBookstore;


-- 1) Retrieve all books in the "Fiction" genre:
SELECT * FROM Books 
WHERE Genre='Fiction';

-- 2) Find books published after the year 1950:
SELECT * FROM Books 
WHERE Published_year>1950;

-- 3) List all customers from the Canada:
SELECT * FROM Customers 
WHERE country='Canada';

-- 4) Show orders placed in November 2023:
SELECT * FROM Orders 
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
SELECT SUM(stock) AS Total_Stock
From Books;

-- 6) Find the details of the most expensive book:
SELECT * FROM Books 
ORDER BY Price DESC 
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders 
WHERE quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders 
WHERE total_amount>20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT genre FROM Books;

-- 10) Find the book with the lowest stock:
SELECT * FROM Books 
ORDER BY stock 
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) As Revenue 
FROM Orders;

-- 12) Retrieve the total number of books sold for each genre:
SELECT b.Genre, SUM(o.Quantity) AS Total_Books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.Genre;

-- 13) Find the average price of books in the "Fantasy" genre:
SELECT AVG(price) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy';

-- 14) List customers who have placed at least 2 orders:
SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >=2;

-- 15) Find the most frequently ordered book:
SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;
