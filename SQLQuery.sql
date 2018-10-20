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
--SELECT
-- Track.Name
-- ,InvoiceLine.InvoiceId
--FROM InvoiceLine
--INNER JOIN Track
--ON InvoiceLine.TrackId = Track.TrackId

--13. Provide a query that includes the purchased track name AND artist name with each invoice line item.
--SELECT
-- TrackName = Track.Name
-- ,InvoiceLine.InvoiceId
-- ,Artist = Artist.Name
--FROM InvoiceLine
--INNER JOIN Track
--ON InvoiceLine.TrackId = Track.TrackId
--INNER JOIN Album
--ON Track.AlbumId = Album.AlbumId
--INNER JOIN Artist
--ON Album.ArtistId = Artist.ArtistId

--14. Provide a query that shows the # of invoices per country. HINT: GROUP BY
--SELECT 
--	BillingCountry
--	,InvoiceCounts = COUNT(*)
--FROM Invoice
--GROUP BY BillingCountry

--15. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.
--SELECT 
--	Playlist.Name
--	,Total = COUNT(*)
--FROM Playlist
--INNER JOIN PlaylistTrack
--ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
--INNER JOIN Track
--ON Track.TrackId = PlaylistTrack.TrackId
--GROUP BY Playlist.Name

--16. Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.
--SELECT 
--	Track.Name
--	,Album.Title
--	,MediaType.Name
--	,Genre.Name
--FROM Track
--INNER JOIN Album
--ON Track.AlbumId = Album.AlbumId
--INNER JOIN MediaType
--ON Track.MediaTypeId = MediaType.MediaTypeId
--INNER JOIN Genre
--ON Track.GenreId = Genre.GenreId

--17. Provide a query that shows all Invoices but includes the # of invoice line items.
--SELECT 
--	Invoice.InvoiceId
--	,COUNT(*)
--FROM Invoice
--INNER JOIN InvoiceLine
--ON Invoice.InvoiceId = InvoiceLine.InvoiceId
--GROUP BY Invoice.InvoiceId

--18. Provide a query that shows total sales made by each sales agent.
--SELECT 
--	SalesAgent = Employee.FirstName + ' ' + Employee.LastName
--	,SUM(Total)
--FROM Invoice
--INNER JOIN Customer
--ON Invoice.CustomerId = Customer.CustomerId
--INNER JOIN Employee
--ON Employee.EmployeeId = Customer.SupportRepId
--WHERE Employee.Title = 'Sales Support Agent'
--GROUP BY Employee.FirstName + ' ' + Employee.LastName

--19. Which sales agent made the most in sales in 2009?
--SELECT top 1
--	Employee.FirstName + ' ' + Employee.LastName AS SalesAgent
--	,SUM(Invoice.Total) AS Total
--FROM Invoice
--INNER JOIN Customer
--ON Invoice.CustomerId = Customer.CustomerId
--INNER JOIN Employee
--ON Employee.EmployeeId = Customer.SupportRepId
--WHERE YEAR(InvoiceDate) = '2009'
--GROUP BY Employee.FirstName + ' ' + Employee.LastName
--ORDER BY SUM(Invoice.Total) DESC

--20. Which sales agent made the most in sales over all?
--SELECT top 1
--	Employee.FirstName + ' ' + Employee.LastName AS SalesAgent
--	,SUM(Invoice.Total) AS Total
--FROM Invoice
--INNER JOIN Customer
--ON Invoice.CustomerId = Customer.CustomerId
--INNER JOIN Employee
--ON Employee.EmployeeId = Customer.SupportRepId
--GROUP BY Employee.FirstName + ' ' + Employee.LastName
--ORDER BY SUM(Invoice.Total) DESC

--21. Provide a query that shows the count of customers assigned to each sales agent.
--SELECT 
--	SalesAgent = Employee.FirstName + ' ' + Employee.LastName
--	,Counts = COUNT(*)
--FROM Employee
--LEFT JOIN Customer
--ON Employee.EmployeeId = Customer.SupportRepId
--WHERE Employee.Title = 'Sales Support Agent'
--GROUP BY Employee.FirstName + ' ' + Employee.LastName

--22. Provide a query that shows the total sales per country.
--SELECT 
--	BillingCountry
--	,SUM(Total)
--FROM Invoice
--GROUP BY BillingCountry

--23. Which country's customers spent the most?
--SELECT 
--	BillingCountry
--	,Total = SUM(Total) 
--FROM Invoice
--GROUP BY BillingCountry
--HAVING SUM(Total) = (
--		SELECT 
--			MAX(Total) 
--		FROM (
--				SELECT 
--					BillingCountry
--					,Total = SUM(Total) 
--				FROM Invoice
--				GROUP BY BillingCountry
--				-- ORDER BY SUM(Total) DESC
--			) AS Derived
--)

--24.  Provide a query that shows the most purchased track of 2013.

--SELECT 
--	Track.Name
--	,Total = SUM(InvoiceLine.Quantity)
--FROM Track
--INNER JOIN InvoiceLine
--ON Track.TrackId = InvoiceLine.InvoiceLineId
--INNER JOIN Invoice
--ON Invoice.InvoiceId = InvoiceLine.InvoiceId
--WHERE YEAR(Invoice.InvoiceDate) = '2013'
--GROUP BY Track.Name
--HAVING SUM(InvoiceLine.Quantity) = (SELECT 
--										MAX(Total)
--									FROM(
--										SELECT 
--											Track.Name
--											,Total = SUM(InvoiceLine.Quantity)
--										FROM Track
--										INNER JOIN InvoiceLine
--										ON Track.TrackId = InvoiceLine.InvoiceLineId
--										INNER JOIN Invoice
--										ON Invoice.InvoiceId = InvoiceLine.InvoiceId
--										WHERE YEAR(Invoice.InvoiceDate) = '2013'
--										GROUP BY Track.Name
--									) AS Derived)
--ORDER BY SUM(InvoiceLine.Quantity) DESC

--25. Provide a query that shows the top 5 most purchased songs.
--SELECT TOP 5
--	Track.Name
--	,Total = SUM(InvoiceLine.Quantity)
--FROM Track
--INNER JOIN InvoiceLine
--ON Track.TrackId = InvoiceLine.InvoiceLineId
--INNER JOIN Invoice
--ON Invoice.InvoiceId = InvoiceLine.InvoiceId
--GROUP BY Track.Name
--ORDER BY SUM(InvoiceLine.Quantity) DESC

--26. Provide a query that shows the top 3 best selling artists
--SELECT TOP 3
--	Artist.Name
--	,Total = SUM(InvoiceLine.Quantity) 
--FROM Artist
--INNER JOIN Album
--ON Artist.ArtistId = Album.ArtistId
--INNER JOIN Track
--ON Album.AlbumId = Track.AlbumId
--INNER JOIN InvoiceLine
--ON InvoiceLine.TrackId = Track.TrackId
--GROUP BY Artist.Name
--ORDER BY Total DESC

--27. Provide a query that shows the most purchased Media Type.
--SELECT 
--	MediaType.Name
--	,Total = SUM(InvoiceLine.Quantity)
--FROM MediaType
--INNER JOIN Track
--ON MediaType.MediaTypeId = Track.MediaTypeId
--INNER JOIN InvoiceLine
--ON InvoiceLine.TrackId = Track.TrackId
--GROUP BY MediaType.Name
--HAVING SUM(InvoiceLine.Quantity) = (SELECT MAX(Total)
--										FROM 
--										(
--											SELECT 
--												MediaType.Name
--												,Total = SUM(InvoiceLine.Quantity)
--											FROM MediaType
--											INNER JOIN Track
--											ON MediaType.MediaTypeId = Track.MediaTypeId
--											INNER JOIN InvoiceLine
--											ON InvoiceLine.TrackId = Track.TrackId
--											GROUP BY MediaType.Name
--										) AS Derived)


-- Pivot
SELECT *
FROM (
		select
			Total
			,[year] = year(invoiceDate)
			-- ,[ColumnSequence] = 'year' + CAST(ROW_NUMBER() over (partition by [total] order by [total]) as varchar(10))
			from Invoice
		where InvoiceDate like '%2009%' or InvoiceDate like '%2011%'
	 ) Temp
PIVOT
(
	SUM(total)
	FOR [year] IN ([2009],[2011])
) Piv