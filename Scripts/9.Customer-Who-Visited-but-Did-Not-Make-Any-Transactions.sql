SELECT 
    customer_id,
    COUNT(customer_id) AS count_no_trans
FROM visits AS v
WHERE v.visit_id NOT IN (SELECT visit_id FROM transactions)
GROUP BY customer_id