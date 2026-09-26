-- Write a solution to find the average selling price for each product. 
-- average_price should be rounded to 2 decimal places. 
-- If a product does not have any sold units, its average selling price is assumed to be 0.

SELECT 
	p.product_id,
    COALESCE(ROUND(SUM(units * price) / NULLIF(SUM(units), 0), 2), 0) AS average_price
FROM prices AS p
LEFT JOIN unitssold AS u
	ON p.product_id = u.product_id AND purchase_date BETWEEN start_date AND  end_date
GROUP BY product_id;