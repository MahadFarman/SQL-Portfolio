CREATE TABLE BOOKS(
	BOOK_ID INT PRIMARY KEY,
	TITLE VARCHAR(100),
	AUTHOR VARCHAR(100),
	GENRE VARCHAR(100),
	PUBLISHED_YEAR INT,
	PRICE NUMERIC(10,2),
	STOCK INT
);

SELECT * FROM BOOKS;

CREATE TABLE CUSTOMERS(
	CUSTOMER_ID INT PRIMARY KEY,
	NAME VARCHAR(100),
	EMAIL VARCHAR(100),
	PHONE VARCHAR(15),
	CITY VARCHAR(50),
	COUNTRY VARCHAR(150)
);

SELECT * FROM CUSTOMERS; 

CREATE TABLE ORDERS(
	ORDER_ID INT PRIMARY KEY,
	CUSTOMER_ID INT REFERENCES
CUSTOMERS(CUSTOMER_ID),
	BOOK_ID INT REFERENCES
BOOKS(BOOK_ID),	
	ORDER_DATE DATE,
	QUANTITY INT,
	TOTAL_AMOUNT NUMERIC(10,2)	
);

SELECT * FROM ORDERS;

COPY
BOOKS(BOOK_ID, TITLE, AUTHOR, GENRE, published_year  , PRICE, STOCK)
FROM 'C:\Users\fisba\Desktop\mahad\30 Day - SQL Practice Files- SD50\30 Day - SQL Practice Files\Books.csv'
DELIMITERS ','
CSV HEADER;

COPY
CUSTOMERS(customer_id, name, email, phone, city, country)
FROM 'C:\Users\fisba\Desktop\mahad\30 Day - SQL Practice Files- SD50\30 Day - SQL Practice Files\Customers.csv'
DELIMITERS ','
CSV HEADER;

COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'C:\Users\fisba\Desktop\mahad\30 Day - SQL Practice Files- SD50\30 Day - SQL Practice Files\Orders.csv'
CSV HEADER;

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM ORDERS;


-- 1) Retrieve all books in the "Fiction" genre:
SELECT * FROM BOOKS
WHERE GENRE='Fiction';

-- 2) Find books published after the year 1950:
SELECT * FROM BOOKS
WHERE published_year>'1950';

-- 3) List all customers from the Canada:
SELECT * FROM customers
WHERE country='Canada';

-- 4) Show orders placed in November 2023:
SELECT * FROM orders
WHERE order_date BETWEEN '01-11-2023' AND '30-11-2023';

-- 5) Retrieve the total stock of books available:
SELECT SUM(stock) AS avaible_stock
from books;

-- 6) Find the details of the most expensive book:
SELECT * FROM books
ORDER BY price DESC
limit 4

-- 7) Show all customers who ordered more than 3 quantity of a book:
SELECT * FROM orders
where quantity> 3;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM orders
where total_amount >=20

-- 9) List all genres available in the Books table:
SELECT DISTINCT genre FROM books

-- 10) Find the book with the lowest stock:
SELECT * FROM books
ORDER BY stock ASC
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(Total_amount) AS Revenue
from orders

-- Advance Questions :

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM ORDERS;

-- 1) Retrieve the total number of books sold for each genre:
SELECT  b.genre, SUM(o.quantity) AS BOOKS_SOLD
FROM books b JOIN orders o
ON b.book_id = o.book_id
GROUP BY b.genre;

-- 2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(price) FROM books 
WHERE genre='Fantasy'

-- 3) List customers who have placed at least 3 orders:
SELECT c.name, o.customer_id, COUNT(o.order_id) AS ORDER_PLACED
FROM customers c JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(order_id) >=3

-- 4) Find the most frequently ordered book:
SELECT o.book_id, b.title, count(o.order_id) AS TOTAL_BOOK_SOLD
FROM books b JOIN orders o
ON b.book_id = o.book_id
GROUP BY o.book_id, b.title
ORDER BY TOTAL_BOOK_SOLD DESC LIMIT 4;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * FROM books
WHERE genre= 'Fantasy'
ORDER BY price DESC LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:
SELECT o.book_id, b.author, SUM(Quantity) AS TOTAL_BOOKS_SOLD
FROM books b JOIN orders o
ON b.book_id = o.book_Id
GROUP BY b.author, o.book_id
ORDER BY TOTAL_BOOKS_SOLD DESC;

-- 7) List the cities where customers who spent over $30 are located:
SELECT c.customer_id, c.city, o.total_amount 
FROM customers c JOIN orders o 
ON c.customer_id = o.customer_id
WHERE o.total_amount >=30;

-- 8) Find the customer who spent the most on orders:
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM customers c JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

--9) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS ORDER_QUANTITY,
		b.stock- COALESCE(SUM(o.quantity),0) AS REMAINING_QUANTITY
FROM books b JOIN orders o
ON b.book_id = o.book_id
GROUP BY b.book_id
ORDER BY b.book_id ASC;


SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM ORDERS;

