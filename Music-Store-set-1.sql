-- Q1) Who is the senior most employeebased on job title?
-- SELECT * FROM employee
-- ORDER BY levels DESC
-- LIMIT 1;

-- Q2) Which countries have the most invoices?
 -- SELECT * FROM invoice
-- SELECT COUNT(*) AS c , billing_country
-- FROM invoice
-- GROUP BY billing_country
-- ORDER BY c DESC; 

-- Q3)What are top 3 values of total invoices?
-- SELECT * 
-- FROM invoice
-- ORDER BY total DESC
-- LIMIT 3;

-- Q4)Which city has the best customers? We would like to hold a festival in the city with the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both city name and sum of all invoice totals.
-- SELECT SUM(total) AS s, billing_city
-- FROM invoice
-- GROUP BY billing_city
-- ORDER BY s DESC
-- LIMIT 1;

-- Q5)Write a query to return the customer who has spent the most money
-- SELECT customer.first_name, customer.last_name, customer.customer_id,customer.country,SUM(invoice.total) AS total
-- FROM customer
-- JOIN invoice ON customer.customer_id = invoice.customer_id
-- GROUP BY customer.customer_id
-- ORDER BY total DESC
-- LIMIT 1;



