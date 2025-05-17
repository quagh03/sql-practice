DROP DATABASE IF EXISTS sales_db;

CREATE DATABASE IF NOT EXISTS sales_db;

USE sales_db;

CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

CREATE TABLE IF NOT EXISTS Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Shippers (
    shipper_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity_in_stock INT NOT NULL,
    supplier_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT,
    order_date DATETIME NOT NULL,
    ship_date DATETIME,
    shipper_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (shipper_id) REFERENCES Shippers(shipper_id)
);

CREATE TABLE IF NOT EXISTS OrderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_each DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE IF NOT EXISTS Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATETIME NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE IF NOT EXISTS Discounts (
    discount_id INT AUTO_INCREMENT PRIMARY KEY,
    discount_name VARCHAR(100) NOT NULL,
    discount_percentage DECIMAL(5, 2) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    rating INT CHECK(rating >= 1 AND rating <= 5),
    review_text TEXT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE IF NOT EXISTS Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    quantity_in_stock INT NOT NULL,
    warehouse_location VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE IF NOT EXISTS Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity_sold INT NOT NULL,
    sale_date DATETIME NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE IF NOT EXISTS Shipments (
    shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    ship_date DATETIME NOT NULL,
    tracking_number VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE IF NOT EXISTS Promotions (
    promotion_id INT AUTO_INCREMENT PRIMARY KEY,
    promotion_name VARCHAR(100) NOT NULL,
    discount_percentage DECIMAL(5, 2) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS SalesTarget (
    target_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    target_amount DECIMAL(10, 2) NOT NULL,
    target_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Customers (name, email, phone, address) VALUES ('Name1', 'name128@example.com', '0803465034', '1 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name2', 'name254@example.com', '0249648873', '2 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name3', 'name315@example.com', '0504486886', '3 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name4', 'name443@example.com', '0713348618', '4 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name5', 'name51@example.com', '0612536481', '5 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name6', 'name66@example.com', '0771673242', '6 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name7', 'name754@example.com', '0700774721', '7 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name8', 'name835@example.com', '0814014948', '8 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name9', 'name97@example.com', '0814207253', '9 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name10', 'name1073@example.com', '0842632486', '10 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name11', 'name1145@example.com', '0326440019', '11 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name12', 'name1226@example.com', '0759190967', '12 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name13', 'name1343@example.com', '0216847400', '13 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name14', 'name1483@example.com', '0316826454', '14 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name15', 'name1565@example.com', '0454258638', '15 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name16', 'name1688@example.com', '0108171289', '16 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name17', 'name1761@example.com', '0674139270', '17 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name18', 'name1847@example.com', '0171518148', '18 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name19', 'name1982@example.com', '0515049865', '19 Street Name, City');
INSERT INTO Customers (name, email, phone, address) VALUES ('Name20', 'name2055@example.com', '0144875197', '20 Street Name, City');
INSERT INTO Categories (category_name) VALUES ('Category1');
INSERT INTO Categories (category_name) VALUES ('Category2');
INSERT INTO Categories (category_name) VALUES ('Category3');
INSERT INTO Categories (category_name) VALUES ('Category4');
INSERT INTO Categories (category_name) VALUES ('Category5');
INSERT INTO Categories (category_name) VALUES ('Category6');
INSERT INTO Categories (category_name) VALUES ('Category7');
INSERT INTO Categories (category_name) VALUES ('Category8');
INSERT INTO Categories (category_name) VALUES ('Category9');
INSERT INTO Categories (category_name) VALUES ('Category10');
INSERT INTO Categories (category_name) VALUES ('Category11');
INSERT INTO Categories (category_name) VALUES ('Category12');
INSERT INTO Categories (category_name) VALUES ('Category13');
INSERT INTO Categories (category_name) VALUES ('Category14');
INSERT INTO Categories (category_name) VALUES ('Category15');
INSERT INTO Categories (category_name) VALUES ('Category16');
INSERT INTO Categories (category_name) VALUES ('Category17');
INSERT INTO Categories (category_name) VALUES ('Category18');
INSERT INTO Categories (category_name) VALUES ('Category19');
INSERT INTO Categories (category_name) VALUES ('Category20');
INSERT INTO Employees (name, email, phone) VALUES ('Name1', 'name15@example.com', '0255142635');
INSERT INTO Employees (name, email, phone) VALUES ('Name2', 'name253@example.com', '0570764591');
INSERT INTO Employees (name, email, phone) VALUES ('Name3', 'name372@example.com', '0625812364');
INSERT INTO Employees (name, email, phone) VALUES ('Name4', 'name436@example.com', '0535230223');
INSERT INTO Employees (name, email, phone) VALUES ('Name5', 'name585@example.com', '0184348114');
INSERT INTO Employees (name, email, phone) VALUES ('Name6', 'name69@example.com', '0754892339');
INSERT INTO Employees (name, email, phone) VALUES ('Name7', 'name767@example.com', '0513722056');
INSERT INTO Employees (name, email, phone) VALUES ('Name8', 'name846@example.com', '0379411725');
INSERT INTO Employees (name, email, phone) VALUES ('Name9', 'name975@example.com', '0178732527');
INSERT INTO Employees (name, email, phone) VALUES ('Name10', 'name1081@example.com', '0841886730');
INSERT INTO Employees (name, email, phone) VALUES ('Name11', 'name1187@example.com', '0629514901');
INSERT INTO Employees (name, email, phone) VALUES ('Name12', 'name1210@example.com', '0468161397');
INSERT INTO Employees (name, email, phone) VALUES ('Name13', 'name1329@example.com', '0710923739');
INSERT INTO Employees (name, email, phone) VALUES ('Name14', 'name1424@example.com', '0582214397');
INSERT INTO Employees (name, email, phone) VALUES ('Name15', 'name1557@example.com', '0790151842');
INSERT INTO Employees (name, email, phone) VALUES ('Name16', 'name169@example.com', '0354994453');
INSERT INTO Employees (name, email, phone) VALUES ('Name17', 'name1766@example.com', '0627767076');
INSERT INTO Employees (name, email, phone) VALUES ('Name18', 'name1846@example.com', '0380789437');
INSERT INTO Employees (name, email, phone) VALUES ('Name19', 'name1943@example.com', '0423218226');
INSERT INTO Employees (name, email, phone) VALUES ('Name20', 'name207@example.com', '0562740260');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company1', 'Name1', '0115750352');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company2', 'Name2', '0918169336');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company3', 'Name3', '0359339942');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company4', 'Name4', '0512968103');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company5', 'Name5', '0392804948');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company6', 'Name6', '0198699760');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company7', 'Name7', '0126133124');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company8', 'Name8', '0291247059');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company9', 'Name9', '0660348700');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company10', 'Name10', '0469433854');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company11', 'Name11', '0175316837');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company12', 'Name12', '0694510078');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company13', 'Name13', '0523720109');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company14', 'Name14', '0992142331');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company15', 'Name15', '0995706561');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company16', 'Name16', '0576720402');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company17', 'Name17', '0143020648');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company18', 'Name18', '0986610190');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company19', 'Name19', '0870673442');
INSERT INTO Suppliers (company_name, contact_name, phone) VALUES ('Company20', 'Name20', '0550797747');
INSERT INTO Shippers (company_name, phone) VALUES ('Company1', '0261061965');
INSERT INTO Shippers (company_name, phone) VALUES ('Company2', '0504578692');
INSERT INTO Shippers (company_name, phone) VALUES ('Company3', '0682135823');
INSERT INTO Shippers (company_name, phone) VALUES ('Company4', '0657965582');
INSERT INTO Shippers (company_name, phone) VALUES ('Company5', '0165887262');
INSERT INTO Shippers (company_name, phone) VALUES ('Company6', '0860482528');
INSERT INTO Shippers (company_name, phone) VALUES ('Company7', '0338187451');
INSERT INTO Shippers (company_name, phone) VALUES ('Company8', '0149667255');
INSERT INTO Shippers (company_name, phone) VALUES ('Company9', '0367078604');
INSERT INTO Shippers (company_name, phone) VALUES ('Company10', '0510668148');
INSERT INTO Shippers (company_name, phone) VALUES ('Company11', '0618856832');
INSERT INTO Shippers (company_name, phone) VALUES ('Company12', '0685228240');
INSERT INTO Shippers (company_name, phone) VALUES ('Company13', '0291503060');
INSERT INTO Shippers (company_name, phone) VALUES ('Company14', '0743171921');
INSERT INTO Shippers (company_name, phone) VALUES ('Company15', '0878218954');
INSERT INTO Shippers (company_name, phone) VALUES ('Company16', '0641491852');
INSERT INTO Shippers (company_name, phone) VALUES ('Company17', '0844273054');
INSERT INTO Shippers (company_name, phone) VALUES ('Company18', '0399261864');
INSERT INTO Shippers (company_name, phone) VALUES ('Company19', '0139182381');
INSERT INTO Shippers (company_name, phone) VALUES ('Company20', '0494596095');
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product1', 3, 581.8, 285, 8);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product2', 13, 704.32, 193, 6);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product3', 11, 415.06, 254, 7);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product4', 20, 247.71, 334, 9);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product5', 18, 774.17, 372, 14);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product6', 8, 468.81, 76, 17);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product7', 10, 977.88, 231, 11);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product8', 11, 839.48, 257, 3);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product9', 3, 123.42, 332, 1);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product10', 19, 346.04, 200, 18);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product11', 17, 282.38, 104, 17);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product12', 7, 830.07, 432, 10);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product13', 19, 536.14, 426, 8);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product14', 6, 903.54, 253, 11);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product15', 17, 28.95, 222, 15);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product16', 12, 972.09, 395, 9);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product17', 10, 982.23, 113, 9);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product18', 7, 491.87, 123, 10);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product19', 16, 402.74, 216, 18);
INSERT INTO Products (name, category_id, price, quantity_in_stock, supplier_id) VALUES ('Product20', 16, 743.03, 91, 19);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (19, 13, '2023-11-25 00:00:00', '2023-12-05 00:00:00', 3);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (9, 16, '2023-12-17 00:00:00', '2023-12-27 00:00:00', 18);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (8, 7, '2023-10-27 00:00:00', '2023-10-29 00:00:00', 13);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (10, 15, '2023-09-06 00:00:00', '2023-09-16 00:00:00', 5);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (18, 20, '2023-07-07 00:00:00', '2023-07-12 00:00:00', 3);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (14, 1, '2023-08-23 00:00:00', '2023-08-30 00:00:00', 14);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (13, 17, '2023-02-02 00:00:00', '2023-02-03 00:00:00', 2);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (17, 1, '2023-07-03 00:00:00', '2023-07-08 00:00:00', 8);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (16, 19, '2023-03-16 00:00:00', '2023-03-19 00:00:00', 7);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (19, 16, '2023-11-18 00:00:00', '2023-11-22 00:00:00', 15);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (13, 17, '2023-03-29 00:00:00', '2023-04-01 00:00:00', 6);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (5, 6, '2023-07-11 00:00:00', '2023-07-14 00:00:00', 7);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (7, 18, '2023-10-03 00:00:00', '2023-10-12 00:00:00', 4);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (18, 13, '2023-02-01 00:00:00', '2023-02-06 00:00:00', 16);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (19, 2, '2023-01-28 00:00:00', '2023-02-04 00:00:00', 5);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (1, 3, '2023-03-26 00:00:00', '2023-03-31 00:00:00', 1);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (6, 7, '2023-07-03 00:00:00', '2023-07-08 00:00:00', 12);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (16, 14, '2023-02-13 00:00:00', '2023-02-23 00:00:00', 9);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (19, 1, '2023-12-16 00:00:00', '2023-12-18 00:00:00', 20);
INSERT INTO Orders (customer_id, employee_id, order_date, ship_date, shipper_id) VALUES (13, 15, '2023-06-17 00:00:00', '2023-06-21 00:00:00', 7);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (8, 16, 5, 824.29);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (1, 20, 10, 511.57);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (4, 6, 4, 911.14);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (15, 19, 9, 24.2);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (1, 16, 7, 928.12);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (5, 5, 5, 725.71);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (9, 7, 5, 723.22);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (8, 20, 2, 86.5);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (15, 16, 7, 139.84);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (10, 3, 9, 724.89);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (1, 20, 4, 719.85);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (8, 15, 2, 730.15);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (16, 20, 6, 448.92);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (2, 18, 10, 119.47);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (17, 20, 10, 856.14);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (8, 8, 2, 70.33);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (13, 12, 10, 542.59);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (5, 8, 8, 106.23);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (20, 8, 8, 404.02);
INSERT INTO OrderDetails (order_id, product_id, quantity, price_each) VALUES (18, 2, 2, 77.21);
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (4, '2023-05-13 00:00:00', 856.6, 'Cash');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (5, '2023-04-30 00:00:00', 2482.66, 'PayPal');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (8, '2023-03-30 00:00:00', 1878.64, 'PayPal');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (5, '2023-10-29 00:00:00', 67.02, 'Cash');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (4, '2023-01-18 00:00:00', 1908.79, 'Credit Card');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (1, '2023-11-02 00:00:00', 3567.97, 'Cash');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (20, '2023-02-18 00:00:00', 1600.61, 'Bank Transfer');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (8, '2023-10-01 00:00:00', 1013.77, 'PayPal');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (13, '2023-09-15 00:00:00', 298.84, 'PayPal');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (11, '2023-03-23 00:00:00', 4257.96, 'Credit Card');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (4, '2023-11-07 00:00:00', 1943.48, 'Credit Card');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (10, '2023-09-21 00:00:00', 2415.34, 'Cash');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (9, '2023-01-20 00:00:00', 2987.51, 'PayPal');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (4, '2023-07-13 00:00:00', 2186.46, 'Credit Card');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (13, '2023-01-30 00:00:00', 1776.15, 'Credit Card');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (12, '2023-07-10 00:00:00', 2147.89, 'Cash');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (2, '2023-01-10 00:00:00', 4771.95, 'PayPal');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (19, '2023-05-24 00:00:00', 4915.38, 'Bank Transfer');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (18, '2023-10-15 00:00:00', 4460.86, 'Credit Card');
INSERT INTO Payments (order_id, payment_date, amount, payment_method) VALUES (9, '2023-04-26 00:00:00', 2263.58, 'Cash');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount1', 26.02, '2023-03-19 00:00:00', '2023-05-02 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount2', 23.62, '2023-03-07 00:00:00', '2023-03-19 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount3', 27.48, '2023-01-05 00:00:00', '2023-02-20 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount4', 18.45, '2023-06-17 00:00:00', '2023-07-31 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount5', 13.08, '2023-04-10 00:00:00', '2023-05-14 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount6', 9.51, '2023-05-17 00:00:00', '2023-07-15 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount7', 20.96, '2023-06-04 00:00:00', '2023-06-24 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount8', 15.38, '2023-04-19 00:00:00', '2023-05-19 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount9', 10.27, '2023-03-16 00:00:00', '2023-04-01 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount10', 26.74, '2023-04-13 00:00:00', '2023-05-17 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount11', 6.6, '2023-06-15 00:00:00', '2023-07-27 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount12', 10.24, '2023-03-13 00:00:00', '2023-05-03 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount13', 9.28, '2023-01-26 00:00:00', '2023-03-25 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount14', 29.43, '2023-01-20 00:00:00', '2023-02-25 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount15', 22.69, '2023-03-16 00:00:00', '2023-03-30 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount16', 21.97, '2023-04-25 00:00:00', '2023-06-10 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount17', 27.14, '2023-05-26 00:00:00', '2023-07-17 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount18', 18.44, '2023-01-12 00:00:00', '2023-02-11 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount19', 23.77, '2023-06-02 00:00:00', '2023-07-09 00:00:00');
INSERT INTO Discounts (discount_name, discount_percentage, start_date, end_date) VALUES ('Discount20', 19.47, '2023-04-16 00:00:00', '2023-05-19 00:00:00');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (18, 17, 4, 'Review text 1');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (6, 10, 3, 'Review text 2');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (3, 13, 5, 'Review text 3');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (3, 14, 2, 'Review text 4');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (17, 11, 5, 'Review text 5');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (6, 18, 4, 'Review text 6');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (11, 4, 3, 'Review text 7');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (7, 4, 1, 'Review text 8');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (13, 2, 4, 'Review text 9');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (5, 20, 1, 'Review text 10');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (1, 15, 5, 'Review text 11');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (2, 14, 1, 'Review text 12');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (4, 10, 2, 'Review text 13');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (18, 8, 2, 'Review text 14');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (17, 12, 3, 'Review text 15');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (5, 6, 2, 'Review text 16');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (20, 16, 2, 'Review text 17');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (2, 16, 2, 'Review text 18');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (20, 8, 5, 'Review text 19');
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES (5, 6, 4, 'Review text 20');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (14, 166, 'Warehouse 1');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (20, 227, 'Warehouse 2');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (6, 123, 'Warehouse 3');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (5, 265, 'Warehouse 4');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (17, 263, 'Warehouse 5');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (13, 117, 'Warehouse 6');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (15, 88, 'Warehouse 7');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (11, 101, 'Warehouse 8');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (13, 271, 'Warehouse 9');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (5, 72, 'Warehouse 10');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (17, 65, 'Warehouse 11');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (6, 250, 'Warehouse 12');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (16, 188, 'Warehouse 13');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (18, 234, 'Warehouse 14');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (4, 174, 'Warehouse 15');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (6, 156, 'Warehouse 16');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (13, 262, 'Warehouse 17');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (1, 180, 'Warehouse 18');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (6, 153, 'Warehouse 19');
INSERT INTO Inventory (product_id, quantity_in_stock, warehouse_location) VALUES (11, 116, 'Warehouse 20');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (11, 16, 13, '2023-07-10 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (14, 7, 6, '2023-07-13 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (12, 12, 16, '2023-08-24 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (2, 20, 6, '2023-05-04 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (7, 3, 20, '2023-10-22 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (5, 10, 20, '2023-12-06 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (6, 6, 18, '2023-08-05 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (17, 3, 5, '2023-02-08 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (7, 7, 4, '2023-04-23 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (9, 5, 15, '2023-01-21 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (6, 15, 10, '2023-07-10 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (5, 16, 6, '2023-11-10 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (2, 12, 9, '2023-09-29 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (20, 19, 9, '2023-07-07 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (6, 3, 1, '2023-11-29 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (15, 10, 20, '2023-08-19 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (2, 20, 11, '2023-02-09 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (13, 12, 19, '2023-06-27 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (15, 17, 10, '2023-11-04 00:00:00');
INSERT INTO Sales (employee_id, product_id, quantity_sold, sale_date) VALUES (11, 19, 12, '2023-04-23 00:00:00');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (2, '2023-01-01 00:00:00', 'TRK00001', 'Shipped');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (14, '2023-01-12 00:00:00', 'TRK00002', 'In Transit');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (5, '2023-12-31 00:00:00', 'TRK00003', 'Delivered');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (6, '2023-11-04 00:00:00', 'TRK00004', 'Delivered');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (13, '2023-07-30 00:00:00', 'TRK00005', 'Shipped');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (10, '2023-11-10 00:00:00', 'TRK00006', 'Shipped');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (9, '2023-12-19 00:00:00', 'TRK00007', 'Shipped');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (4, '2023-12-31 00:00:00', 'TRK00008', 'Shipped');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (20, '2023-12-30 00:00:00', 'TRK00009', 'Pending');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (12, '2023-12-08 00:00:00', 'TRK00010', 'Pending');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (10, '2023-11-01 00:00:00', 'TRK00011', 'Delivered');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (14, '2023-04-03 00:00:00', 'TRK00012', 'Pending');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (14, '2023-04-08 00:00:00', 'TRK00013', 'Shipped');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (1, '2023-07-23 00:00:00', 'TRK00014', 'Pending');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (6, '2023-06-15 00:00:00', 'TRK00015', 'In Transit');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (17, '2023-08-02 00:00:00', 'TRK00016', 'In Transit');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (15, '2023-05-04 00:00:00', 'TRK00017', 'Delivered');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (19, '2023-01-03 00:00:00', 'TRK00018', 'In Transit');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (8, '2023-11-25 00:00:00', 'TRK00019', 'In Transit');
INSERT INTO Shipments (order_id, ship_date, tracking_number, status) VALUES (14, '2023-09-05 00:00:00', 'TRK00020', 'Shipped');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo1', 18.56, '2023-02-19 00:00:00', '2023-02-28 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo2', 20.27, '2023-01-25 00:00:00', '2023-01-31 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo3', 21.71, '2023-03-13 00:00:00', '2023-03-28 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo4', 24.58, '2023-04-16 00:00:00', '2023-05-01 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo5', 16.89, '2023-06-09 00:00:00', '2023-07-01 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo6', 12.01, '2023-06-18 00:00:00', '2023-06-30 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo7', 10.75, '2023-04-12 00:00:00', '2023-04-24 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo8', 14.08, '2023-03-25 00:00:00', '2023-04-02 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo9', 12.87, '2023-06-04 00:00:00', '2023-06-27 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo10', 20.92, '2023-02-23 00:00:00', '2023-02-28 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo11', 21.09, '2023-06-17 00:00:00', '2023-07-06 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo12', 22.98, '2023-06-11 00:00:00', '2023-06-27 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo13', 22.8, '2023-02-24 00:00:00', '2023-03-22 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo14', 22.59, '2023-02-28 00:00:00', '2023-03-23 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo15', 10.16, '2023-04-14 00:00:00', '2023-05-01 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo16', 23.28, '2023-02-19 00:00:00', '2023-03-06 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo17', 13.99, '2023-02-09 00:00:00', '2023-02-27 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo18', 9.74, '2023-06-20 00:00:00', '2023-07-02 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo19', 23.08, '2023-02-24 00:00:00', '2023-03-20 00:00:00');
INSERT INTO Promotions (promotion_name, discount_percentage, start_date, end_date) VALUES ('Promo20', 21.98, '2023-02-22 00:00:00', '2023-03-05 00:00:00');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (3, 4453.18, '2023-10-29');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (18, 8489.39, '2023-08-24');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (13, 12436.77, '2023-09-27');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (6, 3420.46, '2023-11-11');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (14, 3007.16, '2023-02-21');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (3, 12687.26, '2023-06-11');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (16, 9118.48, '2023-02-04');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (18, 14657.18, '2023-11-07');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (16, 12535.9, '2023-02-15');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (13, 10482.41, '2023-06-09');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (14, 2251.81, '2023-01-17');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (3, 7117.23, '2023-06-16');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (6, 16650.72, '2023-07-28');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (12, 19651.94, '2023-01-08');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (6, 11479.91, '2023-05-06');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (4, 2318.37, '2023-06-12');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (12, 6697.82, '2023-10-14');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (8, 10416.63, '2023-05-12');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (16, 9431.69, '2023-05-14');
INSERT INTO SalesTarget (employee_id, target_amount, target_date) VALUES (14, 18909.3, '2023-07-08');