--1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
--SELECT 
--FullName = FirstName + ' ' + LastName
--,CustomerId
--,Country
--FROM Customer
--WHERE Country <> 'USA'

--2. Provide a query only showing the Customers from Brazil.
--SELECT *
--FROM Customer
--WHERE Country = 'Brazil'

--3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
--SELECT 
--	FullName = FirstName + ' ' + LastName
--	,InvoiceId
--	,InvoiceDate
--	,BillingCountry
--FROM Customer
--INNER JOIN Invoice
--ON Customer.CustomerId = Invoice.CustomerId
--WHERE Country = 'Brazil'

--4. Provide a query showing only the Employees who are Sales Agents.
--SELECT *
--FROM Employee
--WHERE Title = 'Sales Support Agent'

--5. Provide a query showing a unique/distinct list of billing countries from the Invoice table.
--SELECT DISTINCT BillingCountry
--FROM Invoice

--6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
--SELECT 
--	SalesAgent = Employee.FirstName + ' ' + Employee.LastName
--	,Invoice.InvoiceId
--FROM Invoice 
--INNER JOIN Customer
--ON Invoice.CustomerId = Customer.CustomerId
--INNER JOIN Employee
--ON Employee.EmployeeId = Customer.SupportRepId

--7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
--SELECT 
--	Invoice.Total
--	,CustomerName = Customer.FirstName + ' ' + Customer.LastName
--	,Customer.Country
--	,SaleAgent = Employee.FirstName + ' ' +  Employee.LastName
--FROM Invoice
--INNER JOIN Customer
--ON Invoice.CustomerId = Customer.CustomerId
--INNER JOIN Employee
--ON Customer.SupportRepId = Employee.EmployeeId

--8. How many Invoices were there in 2009 and 2011?
--SELECT COUNT(*)
--FROM Invoice
--WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-01-01'

--9. What are the respective total sales for each of those years?
--SELECT 
--	YEAR(InvoiceDate)
--	,SUM(Total)
--FROM Invoice
--GROUP BY YEAR(InvoiceDate)

--10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
--SELECT COUNT(*)
--FROM InvoiceLine
--WHERE InvoiceId = 37

--11. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
--SELECT 
--	InvoiceId
--	,Counts = COUNT(*) 
--FROM InvoiceLine
--GROUP BY InvoiceId

--12. Provide a query that includes the purchased track name with each invoice line item.
SELECT
 Track.Name
 ,InvoiceLine.InvoiceId
FROM InvoiceLine
INNER JOIN Track
ON InvoiceLine.TrackId = Track.TrackId
