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


-- 8 total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?
SELECT COUNT(*)
FROM Invoice
WHERE InvoiceDate like "%2011%" OR InvoiceDate like "%2009%";


-- 9 total_sales_{year}.sql: What are the respective total sales for each of those years?
SELECT SUM(total),
    strftime("%Y", InvoiceDate) as year
FROM Invoice
WHERE year = "2009" OR year = "2011"
GROUP BY year;


-- 10 invoice_37_line_item_count.sql: 
-- Looking at the InvoiceLine table, provide a query 
-- that COUNTs the number of line items for Invoice ID 37.
SELECT 
    COUNT(InvoiceLineId)
FROM InvoiceLine
WHERE InvoiceId = 37
;


-- 11 line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query
-- that COUNTs the number of line items for each Invoice.
SELECT COUNT(InvoiceLineId), InvoiceId
FROM InvoiceLine 
GROUP BY InvoiceId;

SELECT * 
FROM InvoiceLine
WHERE InvoiceId = 10;

-- 12 line_item_track.sql: Provide a query that includes 
-- the purchased track name with each invoice line item.
SELECT i.Name, i.InvoiceLineId, i.InvoiceId
FROM InvoiceLine i
    JOIN Track AS t ON i.TrackId = t.TrackId
;