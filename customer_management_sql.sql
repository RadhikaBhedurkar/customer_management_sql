CREATE DATABASE CRM;

USE CRM;

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    company VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Interactions (
    interaction_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    interaction_type ENUM('Call','Email','Meeting'),
    interaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    handled_by VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Leads (
    lead_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    lead_status ENUM('New','Contacted','Qualified','Converted','Lost'),
    potential_value DECIMAL(10,2),
    assigned_to VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    description TEXT
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE SupportTickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    issue_type VARCHAR(100),
    status ENUM('Open','In Progress','Closed'),
    created_at DATETIME,
    resolved_at DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);



INSERT INTO Customers (first_name, last_name, email, phone, company, created_at) VALUES
('Riya', 'Sharma', 'riya.sharma@example.com', '9876543210', 'TechNova Pvt Ltd', '2024-10-10'),
('Amit', 'Patel', 'amit.patel@example.com', '9988776655', 'Patel Industries', '2024-11-12'),
('Sneha', 'Mehta', 'sneha.mehta@example.com', '9123456780', 'Mehta & Co', '2025-01-05'),
('Karan', 'Singh', 'karan.singh@example.com', '9812345678', 'Singh Traders', '2025-02-20'),
('Pooja', 'Verma', 'pooja.verma@example.com', '9001122334', 'Verma Solutions', '2025-03-15'),
('Rohit', 'Agarwal', 'rohit.agarwal@example.com', '9822334455', 'Agarwal Logistics', '2025-04-01'),
('Anjali', 'Nair', 'anjali.nair@example.com', '9090909090', 'Nair Technologies', '2025-05-09'),
('Deepak', 'Gupta', 'deepak.gupta@example.com', '9811112222', 'Gupta Enterprises', '2025-06-12'),
('Priya', 'Rao', 'priya.rao@example.com', '9877601234', 'Rao Textiles', '2025-07-18'),
('Manish', 'Kulkarni', 'manish.kulkarni@example.com', '9922334455', 'Kulkarni Associates', '2025-08-10');


INSERT INTO Interactions (customer_id, interaction_type, interaction_date, notes, handled_by) VALUES
(1, 'Call', '2025-01-15', 'Discussed new software requirements', 'Neha'),
(2, 'Email', '2025-02-20', 'Sent product brochure', 'Arjun'),
(3, 'Meeting', '2025-03-05', 'Demo scheduled for CRM tool', 'Neha'),
(4, 'Call', '2025-03-10', 'Follow-up on proposal', 'Raj'),
(5, 'Email', '2025-04-01', 'Sent quotation for service package', 'Arjun'),
(6, 'Meeting', '2025-04-12', 'Negotiated final price', 'Raj'),
(7, 'Email', '2025-05-20', 'Sent contract draft', 'Neha'),
(8, 'Call', '2025-06-05', 'Customer requested support', 'Arjun'),
(9, 'Meeting', '2025-07-08', 'Demo of analytics dashboard', 'Raj'),
(10, 'Call', '2025-07-20', 'Follow-up on payment status', 'Neha');


INSERT INTO Leads (customer_id, lead_status, potential_value, assigned_to, created_at) VALUES
(1, 'Converted', 120000.00, 'Neha', '2025-01-10'),
(2, 'Qualified', 80000.00, 'Arjun', '2025-02-15'),
(3, 'Contacted', 50000.00, 'Neha', '2025-03-01'),
(4, 'Lost', 40000.00, 'Raj', '2025-03-08'),
(5, 'Converted', 100000.00, 'Arjun', '2025-04-05'),
(6, 'Qualified', 90000.00, 'Raj', '2025-04-10'),
(7, 'New', 60000.00, 'Neha', '2025-05-10'),
(8, 'Contacted', 70000.00, 'Arjun', '2025-06-01'),
(9, 'Converted', 95000.00, 'Raj', '2025-07-10'),
(10, 'Lost', 55000.00, 'Neha', '2025-08-05');


INSERT INTO Products (product_name, price, description) VALUES
('CRM Basic Plan', 25000.00, 'Basic CRM package with contact management'),
('CRM Pro Plan', 50000.00, 'Advanced CRM with reporting and analytics'),
('CRM Enterprise Plan', 100000.00, 'Full-feature CRM for large organizations'),
('Email Marketing Add-on', 15000.00, 'Automated email campaigns'),
('Support Module', 20000.00, 'Customer support ticketing system');


INSERT INTO Orders (customer_id, product_id, order_date, quantity, total_amount) VALUES
(1, 3, '2025-01-25', 1, 100000.00),
(2, 2, '2025-02-28', 1, 50000.00),
(3, 1, '2025-03-10', 2, 50000.00),
(5, 3, '2025-04-15', 1, 100000.00),
(6, 2, '2025-04-20', 1, 50000.00),
(9, 3, '2025-07-20', 1, 100000.00),
(8, 1, '2025-06-18', 2, 50000.00),
(7, 4, '2025-05-22', 1, 15000.00),
(10, 1, '2025-08-15', 1, 25000.00);


INSERT INTO SupportTickets (customer_id, issue_type, status, created_at, resolved_at) VALUES
(1, 'Login issue', 'Closed', '2025-02-01', '2025-02-03'),
(3, 'Data sync error', 'In Progress', '2025-03-12', NULL),
(5, 'Billing issue', 'Closed', '2025-04-18', '2025-04-20'),
(8, 'Email integration', 'Open', '2025-06-08', NULL),
(9, 'Dashboard not loading', 'Closed', '2025-07-25', '2025-07-27');


-- List all customers from “TechNova Pvt Ltd”.

SELECT * 
FROM Customers 
WHERE company = 'TechNova Pvt Ltd';


-- Find customers who have made at least one purchase.

SELECT DISTINCT c.first_name, c.last_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;


-- Show all interactions handled by “Neha”.

SELECT c.first_name, c.last_name, i.interaction_type, i.interaction_date
FROM Interactions i
JOIN Customers c ON i.customer_id = c.customer_id
WHERE i.handled_by = 'Neha';


-- Display customers who have not placed any order yet.

SELECT c.first_name, c.last_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;


-- Show total revenue generated from each product.

SELECT p.product_name, SUM(o.total_amount) AS total_revenue
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_name;


-- Find the lead with the highest potential value.

SELECT * 
FROM Leads
ORDER BY potential_value DESC
LIMIT 1;


-- Count how many leads are in each status.

SELECT lead_status, COUNT(*) AS total_leads
FROM Leads
GROUP BY lead_status;


-- Find total number of customers handled by each employee.

SELECT handled_by, COUNT(DISTINCT customer_id) AS total_customers
FROM Interactions
GROUP BY handled_by;


-- Show all customers who converted from leads.

SELECT c.first_name, c.last_name, l.potential_value
FROM Leads l
JOIN Customers c ON l.customer_id = c.customer_id
WHERE l.lead_status = 'Converted';


-- List top 3 customers by total spending.

SELECT c.first_name, c.last_name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 3;


-- Find customers who purchased “CRM Pro Plan”.

SELECT DISTINCT c.first_name, c.last_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id
WHERE p.product_name = 'CRM Pro Plan';


-- Get the total number of interactions for each customer.

SELECT c.first_name, c.last_name, COUNT(i.interaction_id) AS total_interactions
FROM Customers c
LEFT JOIN Interactions i ON c.customer_id = i.customer_id
GROUP BY c.customer_id;


-- Find customers with open support tickets.

SELECT c.first_name, c.last_name, s.issue_type, s.status
FROM SupportTickets s
JOIN Customers c ON s.customer_id = c.customer_id
WHERE s.status = 'Open';


-- Show all leads assigned to “Arjun” and their current status.

SELECT c.first_name, c.last_name, l.lead_status, l.potential_value
FROM Leads l
JOIN Customers c ON l.customer_id = c.customer_id
WHERE l.assigned_to = 'Arjun';


-- Find the average potential value of all leads.

SELECT AVG(potential_value) AS avg_potential
FROM Leads;


-- Count total number of customers per company.

SELECT company, COUNT(*) AS total_customers
FROM Customers
GROUP BY company;


-- List all orders placed after June 2025.

SELECT o.order_id, c.first_name, c.last_name, o.order_date, o.total_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.order_date > '2025-06-30';


-- Show monthly total sales for 2025.

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS total_sales
FROM Orders
WHERE YEAR(order_date) = 2025
GROUP BY month
ORDER BY month;


-- Display customers who have interacted more than twice.

SELECT c.first_name, c.last_name, COUNT(i.interaction_id) AS total_interactions
FROM Customers c
JOIN Interactions i ON c.customer_id = i.customer_id
GROUP BY c.customer_id
HAVING total_interactions > 2;


-- Show average order amount per customer.

SELECT c.first_name, c.last_name, AVG(o.total_amount) AS avg_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;


-- List all customers who have raised a support ticket and also made a purchase.

SELECT DISTINCT c.first_name, c.last_name
FROM Customers c
JOIN SupportTickets s ON c.customer_id = s.customer_id
JOIN Orders o ON c.customer_id = o.customer_id;


-- Find the employees who have handled the most interactions.

SELECT handled_by, COUNT(*) AS total_interactions
FROM Interactions
GROUP BY handled_by
ORDER BY total_interactions DESC
LIMIT 1;


-- Display all customers who were added in 2025.

SELECT * 
FROM Customers
WHERE YEAR(created_at) = 2025;


-- Show leads that were lost but had potential value above 50,000.

SELECT c.first_name, c.last_name, l.potential_value
FROM Leads l
JOIN Customers c ON l.customer_id = c.customer_id
WHERE l.lead_status = 'Lost' AND l.potential_value > 50000;


-- Find total number of support tickets by status.

SELECT status, COUNT(*) AS total_tickets
FROM SupportTickets
GROUP BY status;


-- Get company-wise total potential sales (sum of potential values for all leads).

SELECT c.company, SUM(l.potential_value) AS total_potential_value
FROM Customers c
JOIN Leads l ON c.customer_id = l.customer_id
GROUP BY c.company;


-- Find the most recent interaction date for each customer.

SELECT c.first_name, c.last_name, MAX(i.interaction_date) AS last_contact
FROM Customers c
JOIN Interactions i ON c.customer_id = i.customer_id
GROUP BY c.customer_id;


-- Calculate total revenue per employee based on the leads they managed (converted only).

SELECT l.assigned_to, SUM(o.total_amount) AS total_revenue
FROM Leads l
JOIN Orders o ON l.customer_id = o.customer_id
WHERE l.lead_status = 'Converted'
GROUP BY l.assigned_to;


-- Show all customers with both interactions and leads assigned to ‘Neha’.

SELECT DISTINCT c.first_name, c.last_name
FROM Customers c
JOIN Interactions i ON c.customer_id = i.customer_id
JOIN Leads l ON c.customer_id = l.customer_id
WHERE i.handled_by = 'Neha' AND l.assigned_to = 'Neha';


-- Find total orders, total value, and average order value across all customers.

SELECT 
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS avg_order_value
FROM Orders;











