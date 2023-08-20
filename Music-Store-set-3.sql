-- Q1)How much amount spent by each customer on artists?
-- Write query to return customer_name,artist name and total spent

-- SELECT
--    c.first_name,
--    c.last_name,
--    a.name AS artist_name,
--    SUM(il.unit_price * il.quantity) AS total
-- FROM customer c
-- JOIN invoice i ON c.customer_id = i.customer_id
-- JOIN invoice_line il ON i.invoice_id = il.invoice_id
-- JOIN track t ON il.track_id = t.track_id
-- JOIN album al ON t.album_id = al.album_id
-- JOIN artist a ON al.artist_id = a.artist_id
-- GROUP BY c.customer_id, a.artist_id
-- ORDER BY total DESC
-- LIMIT 10;

-- Q2)Find out most popular genre for each country. 
-- We determine most popular genre as genre with highest number of purchases.
-- Write a query that returns each country along with top genre.
-- For countries where maximum number of purchases is shared, return all genres.

-- WITH popular_genre AS 
-- (
--    SELECT COUNT(invoice_line.quantity) AS purchases, customer.country, genre.name, genre.genre_id, 
-- ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS RowNo 
--    FROM invoice_line 
-- JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
-- JOIN customer ON customer.customer_id = invoice.customer_id
-- JOIN track ON track.track_id = invoice_line.track_id
-- JOIN genre ON genre.genre_id = track.genre_id
-- GROUP BY 2,3,4
-- ORDER BY 2 ASC, 1 DESC
-- )
-- SELECT * FROM popular_genre WHERE RowNo <= 1;

WITH Customer_with_country AS (
		SELECT customer.customer_id,first_name,last_name,billing_country,SUM(total) AS total_spending,
	    ROW_NUMBER() OVER(PARTITION BY billing_country ORDER BY SUM(total) DESC) AS RowNo 
		FROM invoice
		JOIN customer ON customer.customer_id = invoice.customer_id
		GROUP BY 1,2,3,4
		ORDER BY 4 ASC,5 DESC)
SELECT * FROM Customer_with_country WHERE RowNo <= 1








