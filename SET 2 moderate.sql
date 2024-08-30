QUESTION SET 2 
--1. Write query to return the email, first name, last name, & Genre of all Rock Music
--listeners. Return your list ordered alphabetically by email starting with A

SELECT DISTINCT email, first_name, last_name
FROM customer as c
JOIN invoice as i ON c.customer_id = i.customer_id 
JOIN invoice_line as i_l ON i.invoice_id = i_l.invoice_id
WHERE track_id IN (
    SELECT track_id FROM track
	JOIN genre ON track.genre_id = genre.genre_id
	WHERE genre.name = 'Rock'
)
ORDER BY email;

--2. Let's invite the artists who have written the most rock music in our dataset. Write a
--query that returns the Artist name and total track count of the top 10 rock bands
SELECT artist.name,artist.artist_id,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name ='Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10


--3. Return all the track names that have a song length longer than the average song length.
--Return the Name and Milliseconds for each track. Order by the song length with the
--longest songs listed first

SELECT name,milliseconds
FROM track 
WHERE milliseconds > (
 SELECT AVG(milliseconds) AS avg_milliseconds
	FROM track
)
ORDER BY milliseconds DESC





SELECT * FROM genre
SELECT * FROM artist
SELECT * FROM track
 