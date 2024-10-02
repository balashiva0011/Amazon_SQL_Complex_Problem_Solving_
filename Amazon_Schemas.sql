-- Amazon Project - Advanced SQL 



-- Hi please make sure to follow below hirearary to import the data
-- 1st import to category table
-- 2nd Import to customers
-- 3rd Import to sellers
-- 4th Import to Products
-- 5th Import to orders
-- 6th Import to order_items
-- 7th Import to payments
-- 8th Import to shippings table
-- 9th Import to Inventory Table

DROP TABLE IF EXISTS shippings;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS sellers;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS category;


-- category TABLE
CREATE TABLE category
(
category_id	INT PRIMARY KEY,
category_name VARCHAR(20)
);

-- customers TABLE

CREATE TABLE customers
(
customer_id INT PRIMARY KEY,	
first_name	VARCHAR(20),
last_name	VARCHAR(20),
state VARCHAR(20)
);

-- sellers TABLE
CREATE TABLE sellers
(
seller_id INT PRIMARY KEY,
seller_name	VARCHAR(25),
origin VARCHAR(15)
);

-- updating data types
ALTER TABLE sellers
ALTER COLUMN origin TYPE VARCHAR(10)
;

-- products table
CREATE TABLE products
(
product_id INT PRIMARY KEY,	
product_name VARCHAR(50),	
price	FLOAT,
cogs	FLOAT,
category_id INT, -- FK 
CONSTRAINT product_fk_category FOREIGN KEY(category_id) REFERENCES category(category_id)
);

-- orders
CREATE TABLE orders
(
order_id INT PRIMARY KEY, 	
order_date	DATE,
customer_id	INT, -- FK
seller_id INT, -- FK 
order_status VARCHAR(15),
CONSTRAINT orders_fk_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
CONSTRAINT orders_fk_sellers FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);

CREATE TABLE order_items
(
order_item_id INT PRIMARY KEY,
order_id INT,	-- FK 
product_id INT, -- FK
quantity INT,	
price_per_unit FLOAT,
CONSTRAINT order_items_fk_orders FOREIGN KEY (order_id) REFERENCES orders(order_id),
CONSTRAINT order_items_fk_products FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- payment TABLE
CREATE TABLE payments
(
payment_id	
INT PRIMARY KEY,
order_id INT, -- FK 	
payment_date DATE,
payment_status VARCHAR(20),
CONSTRAINT payments_fk_orders FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


CREATE TABLE shippings
(
shipping_id	INT PRIMARY KEY,
order_id	INT, -- FK
shipping_date DATE,	
return_date	 DATE,
shipping_providers	VARCHAR(15),
delivery_status VARCHAR(15),
CONSTRAINT shippings_fk_orders FOREIGN KEY (order_id) REFERENCES orders(order_id)
);



CREATE TABLE inventory
(
inventory_id INT PRIMARY KEY,
product_id INT, -- FK
stock INT,
warehouse_id INT,
last_stock_date DATE,
CONSTRAINT inventory_fk_products FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- End of schemas