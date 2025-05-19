-- Walmart Sales Analysis
SELECT * FROM walmart;

--1.Which payment method is used most frequently by customers?

SELECT 
	payment_method, 
	COUNT(invoice_id) AS most_used_method
FROM walmart
GROUP BY payment_method
ORDER BY most_used_method DESC
LIMIT 1;


--2.What is the distribution of ratings across all transactions?

SELECT 
	rating, 
	COUNT(*) AS transaction_count
FROM walmart
GROUP BY rating
ORDER BY rating DESC;


--3.Calculate Total Quantity Sold by Payment Method.

SELECT 
	payment_method, 
	SUM(quantity) AS total_quantity_sold
FROM walmart
GROUP BY payment_method
ORDER BY total_quantity_sold DESC;


--4.What is the average rating for each product category? 

SELECT 
	category, 
	ROUND(AVG(CAST(rating AS NUMERIC)),2) AS average_rating
FROM walmart
GROUP BY category
ORDER BY average_rating DESC;


--5.What are the different payment methods, 
--  and how many transactions and items were sold with each method?

SELECT 
	payment_method, 
	COUNT( invoice_id) AS transaction_count,
	SUM(quantity) AS total_items_sold
FROM walmart
GROUP BY payment_method;


--6.What are the average, minimum, and maximum ratings for each category in each city? 

SELECT
	city,
	category,
	ROUND(AVG(CAST(rating AS NUMERIC)),2) AS average_rating,
	MIN(rating) AS minimum_rating,
	MAX(rating) AS maximum_rating
FROM walmart
GROUP BY city,category
ORDER BY city,category;


--7.What is the total profit for each category, ranked from highest to lowest? 

CREATE OR REPLACE VIEW  profit_analysis 
AS
	(SELECT 
		category, 
		ROUND(SUM(total_profit)) AS total_profit,
		RANK() OVER( ORDER BY ROUND(SUM(total_profit)) DESC)
	 FROM walmart
	 GROUP BY category
	)
SELECT * FROM profit_analysis;


--8.How many transactions occur in each shift (Morning, Afternoon, Evening) across branches? 

SELECT
    CASE
        WHEN time >= '06:00:00' AND time < '12:00:00' THEN 'Morning'
        WHEN time >= '12:00:00' AND time < '18:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS sales_shift,
    COUNT(*) AS transaction_count
FROM walmart
GROUP BY sales_shift
ORDER BY sales_shift;


--9.What is the most frequently used payment method in each branch?

WITH PaymentMethodCounts AS(
	SELECT 
		branch,
		payment_method,
		COUNT(*) AS method_count,
		DENSE_RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS d_rank
	FROM walmart
	GROUP BY branch, payment_method
)

SELECT branch, payment_method AS most_frequently_used_method
FROM PaymentMethodCounts
WHERE d_rank = 1;

--10.Which category received the highest average rating in each branch?

WITH CategoryAvgRating AS(
	SELECT
		branch,
		category,
		ROUND(AVG(CAST(rating AS NUMERIC)),2) AS avg_rating,
		DENSE_RANK() OVER(PARTITION BY branch ORDER BY ROUND(AVG(CAST(rating AS NUMERIC)),2) DESC) AS d_rank
	FROM walmart
	GROUP BY branch, category
)

SELECT branch, category AS highest_rated_category, avg_rating AS average_rating
FROM CategoryAvgRating
WHERE d_rank = 1;