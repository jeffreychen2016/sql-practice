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

