--Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT 
FullName = FirstName + ' ' + LastName
,CustomerId
,Country
FROM Customer
WHERE Country <> 'USA'

--Provide a query only showing the Customers from Brazil.
SELECT *
FROM Customer
WHERE Country = 'Brazil'