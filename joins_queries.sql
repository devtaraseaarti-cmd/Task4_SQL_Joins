select * from Customer;
----- INNER JOIN: Customers with their Orders
SELECT 
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    i.InvoiceId,
    i.InvoiceDate,
    i.Total
FROM Customer c
INNER JOIN Invoice i
    ON c.CustomerId = i.CustomerId;


 ----- Customers who never placed any order
SELECT 
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM Customer c
LEFT JOIN Invoice i
    ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;



----- Revenue per Track (Product)
SELECT 
    t.Name AS TrackName,
    SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM InvoiceLine il
INNER JOIN Track t
    ON il.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY TotalRevenue DESC;



-----Revenue by Genre
SELECT 
    g.Name AS Genre,
    SUM(il.UnitPrice * il.Quantity) AS GenreRevenue
FROM InvoiceLine il
INNER JOIN Track t ON il.TrackId = t.TrackId
INNER JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY GenreRevenue DESC;




----- Sales in USA between dates
SELECT 
    c.Country,
    i.InvoiceDate,
    i.Total
FROM Customer c
INNER JOIN Invoice i
    ON c.CustomerId = i.CustomerId
WHERE c.Country = 'USA'
AND i.InvoiceDate BETWEEN '2012-01-01' AND '2013-12-31';




SELECT 
    c.FirstName,
    c.LastName,
    i.Total
FROM Customer c
JOIN Invoice i
ON c.CustomerId = i.CustomerId;


