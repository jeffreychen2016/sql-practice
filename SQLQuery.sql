--Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
--SELECT 
--FullName = FirstName + ' ' + LastName
--,CustomerId
--,Country
--FROM Customer
--WHERE Country <> 'USA'

--Provide a query only showing the Customers from Brazil.
--SELECT *
--FROM Customer
--WHERE Country = 'Brazil'

--Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT 
	FullName = FirstName + ' ' + LastName
	,InvoiceId
	,InvoiceDate
	,BillingCountry
FROM Customer
INNER JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId
WHERE Country = 'Brazil'