Q1 Who is the senior most employee based on job title?

SELECT * FROM employee
ORDER BY levels desc
limit 1

Q2 Which countries have the most Invoices?
SELECT Count (*) , billing_country 
FROM invoice
GROUP BY billing_country
ORDER BY count desc

Q3 What are top 3 values of total invoice?
SELECT * FROM invoice
ORDER BY total desc
limit 3

Q4. Which city has the best customers? We would like to throw a promotional Music
Festival in the city we made the most money. Write a query that returns one city that
has the highest sum of invoice totals. Return both the city name & sum of all invoice
totals
SELECT SUM(total) as total_invoice, billing_city
FROM invoice
group by billing_city
ORDER BY total_invoice desc

Q5. Who is the best customer? The customer who has spent the most money will be
declared the best customer. Write a query that returns the person who has spent the
most money

SELECT customer.customer_id,customer.first_name,customer.last_name,SUM(invoice.total) as total
FROM customer 
JOIN invoice 
ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total desc
limit 1

