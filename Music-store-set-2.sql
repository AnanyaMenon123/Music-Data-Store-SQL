-- Q1)Write query to return email, first name, last name, and genre of all rock music listeners. Return list ordered alphabetically by email starting from A.
-- SELECT DISTINCT customer.first_name, customer.last_name, customer.email
-- FROM customer
-- JOIN invoice ON customer.customer_id = invoice.customer_id
-- JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
-- WHERE track_id IN (
--    SELECT track_id FROM track
--    JOIN genre ON track.genre_id = genre.genre_id
-- WHERE genre.name LIKE 'Rock'
-- )
-- ORDER BY customer.email;

-- Q2) Return the artists who have written the most rock music in our dataset. Write a query that returns artist name and total track counts of top 10 rock bands.
-- SELECT artist.artist_id, artist.name, COUNT(track.track_id) AS number_of_songs
-- FROM track
-- JOIN album ON album.album_id = track.album_id
-- JOIN artist ON artist.artist_id = album.artist_id
-- JOIN genre ON genre.genre_id = track.genre_id
-- WHERE genre.name LIKE 'Rock'
-- GROUP BY artist.artist_id
-- ORDER BY number_of_songs DESC
-- LIMIT 10;

-- Q3)Return all the track names that have song length longer than average song length
-- Return  name and milliseconds for each track. 
-- Order by song length with longest songs listed first

-- SELECT name, milliseconds
-- FROM track
-- WHERE milliseconds > (
--    SELECT AVG(milliseconds) 
--    FROM track
-- )
-- ORDER BY milliseconds DESC;


