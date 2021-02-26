-- non_usa_customers.sql: Provide a query showing Customers 
-- (just their full names, customer ID and country) 
-- who are not in the US.

SELECT FirstName, LastName, CustomerId, Country
FROM Customer 
WHERE Country != "USA";


-- brazil_customers.sql: Provide a query only showing the Customers from Brazil.;

SELECT *
FROM Customer 
WHERE Country = "Brazil";


-- brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. 
-- The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT FirstName, LastName, InvoiceId, InvoiceDate, BillingCountry
FROM Customer 
JOIN Invoice
    ON Customer.CustomerId = Invoice.CustomerId
WHERE Country = "Brazil";


-- sales_agents.sql: Provide a query showing only the Employees who are Sales Agents

SELECT *
FROM Employee
WHERE Title LIKE "%Agent%";


-- unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.

SELECT DISTINCT BillingCountry
FROM Invoice;


-- sales_agent_invoices.sql: Provide a query that shows the invoices 
-- associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT Employee.FirstName || ' ' || Employee.LastName AS FullName, InvoiceId
FROM Employee
JOIN Customer
    ON Employee.EmployeeId = Customer.SupportRepId
JOIN Invoice
    ON Customer.CustomerId = Invoice.CustomerId
WHERE Title LIKE "%Agent%";


-- 7 invoice_totals.sql: Provide a query that shows the Invoice Total,
-- Customer name, Country and Sale Agent name for all invoices and customers.

SELECT Total, c.FirstName || ' ' || c.LastName AS CFullName, c.Country, e.FirstName || ' ' || e.LastName AS EFullName
FROM Employee e
JOIN Customer c
    ON e.EmployeeId = c.SupportRepId 
JOIN Invoice i
    ON c.CustomerId = i.CustomerId
WHERE Title LIKE "%Agent%";