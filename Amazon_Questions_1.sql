
/*
11. Top Performing Sellers
Find the top 5 sellers based on total sales value.
Challenge: Include both successful and failed orders, and display their percentage of successful orders.
*/

/*
12. Product Profit Margin
Calculate the profit margin for each product (difference between price and cost of goods sold).
Challenge: Rank products by their profit margin, showing highest to lowest.
*/

-- o - oi - prod
-- group pid sum(total_sale - cogs * qty) as profit

/*
13. Most Returned Products
Query the top 10 products by the number of returns.
Challenge: Display the return rate as a percentage of total units sold for each product.
*/


/*
14. Inactive Sellers
Identify sellers who haven’t made any sales in the last 6 months.
Challenge: Show the last sale date and total sales from those sellers.
*/

/*
15. IDENTITY customers into returning or new
if the customer has done more than 5 return categorize them as returning otherwise new
Challenge: List customers id, name, total orders, total returns
*/

/*
16. Top 5 Customers by Orders in Each State
Identify the top 5 customers with the highest number of orders for each state.
Challenge: Include the number of orders and total sales for each customer.
*/


/*
17. Revenue by Shipping Provider
Calculate the total revenue handled by each shipping provider.
Challenge: Include the total number of orders handled and the average delivery time for each provider.
*/

-- oi - o - shipping
-- group by shipping provider id sum(total sale), total orders 


/*
19. Top 10 product with highest decreasing revenue ratio compare to last year(2022) and current_year(2023)
Challenge: Return product_id, product_name, category_name, 2022 revenue and 2023 revenue decrease ratio at end Round the result
Note: Decrease ratio = cr-ls/ls* 100 (cs = current_year ls=last_year)
*/

-- join o -oi- p 
-- filter 2022
-- group by p id sum(total sale) 


-- join o -oi- p 
-- filter 2023
-- group by p id sum(total sale) 

-- join 1 -2 

-- End of Questions 