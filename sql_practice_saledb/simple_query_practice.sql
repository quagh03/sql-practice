USE sales_db;

#List all customers
SELECT * FROM Customers;

#List products with name and price
SELECT name, price FROM Products;

#List orders and order date
SELECT order_id, order_date FROM Orders;

#Count customers
SELECT COUNT(customer_id) AS 'total_customers' FROM Customers;

#Count products in each category
SELECT category_id, COUNT(product_id) AS 'product_count'
FROM Products
GROUP BY category_id;

#Total income
SELECT SUM(amount) FROM Payments;

#List top 5 expensive products
SELECT name, price FROM Products
ORDER BY price DESC
LIMIT 5;

#Find order with ship after 2023-12-05
SELECT order_id
FROM Orders
WHERE ship_date < '2023-12-05';

#List products with supplier
SELECT Products.name, Suppliers.company_name
FROM Products JOIN Suppliers
ON Products.supplier_id = Suppliers.supplier_id;

#List order and customer name
SELECT Orders.order_id, Customers.name, Orders.order_date
FROM Orders JOIN Customers
ON Orders.customer_id = Customers.customer_id;

#Count number of reviews each product
SELECT Reviews.product_id, COUNT(Reviews.review_id)
FROM Reviews
GROUP BY product_id;

#Calc avg rating
SELECT Reviews.product_id, AVG(Reviews.rating) AS avg_rating
FROM Reviews
GROUP BY product_id;

#Find product with qty < 50
SELECT Inventory.product_id, Inventory.quantity_in_stock
FROM Inventory
WHERE Inventory.quantity_in_stock < 100;

#Find total sold base on product
SELECT Sales.product_id, COUNT(Sales.sale_id) AS total_sold
FROM Sales
GROUP BY product_id;

#Find emp with best sale perf
SELECT Sales.employee_id, COUNT(Sales.sale_id) as total
FROM Sales
GROUP BY employee_id
HAVING total = (
    SELECT MAX(total_sales)
    FROM(
        SELECT COUNT(sale_id) AS total_sales
        FROM Sales
        GROUP BY employee_id
        ) AS subquery
    )
ORDER BY total DESC;

#Find total for each Order
SELECT OrderDetails.order_id, SUM(OrderDetails.quantity*OrderDetails.price_each) AS total_amt
FROM OrderDetails
GROUP BY OrderDetails.order_id;

#Find valid promotions base on date
SELECT Promotions.promotion_name, Promotions.discount_percentage
FROM Promotions WHERE start_date <= NOW() <= end_date;

#Find KPI percentage each emp
SELECT st.employee_id,
       st.target_amount,
       IFNULL(s.actual_sales, 0) AS actual_sales,
       ROUND((IFNULL(actual_sales, 0) / st.target_amount) * 100 , 2) AS percent_archived
FROM SalesTarget st LEFT JOIN (
    SELECT s.employee_id, SUM(s.quantity_sold*p.price) as actual_sales
    FROM Sales s JOIN Products p
    ON s.product_id = p.product_id
    GROUP BY employee_id
) s ON s.employee_id = st.employee_id;

#Find oder by month
SELECT MONTH(Orders.order_date) AS month, COUNT(order_id) AS order_count
FROM Orders
GROUP BY month
ORDER BY month;




