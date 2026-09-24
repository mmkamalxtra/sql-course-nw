/*
This is an exercise in practising writing joins between tables.
It uses the Chinook database.
To get you started, here are the SQL statements to retrieve the relevant columns of the Invoice, Customer and Employee tables.
*/

SELECT
    i.InvoiceId
    ,i.CustomerId
    ,i.InvoiceDate
    ,i.Total
FROM
    Invoice i;

SELECT
    c.CustomerId
    ,c.FirstName
    ,c.LastName
    ,c.City
FROM
    Customer c;

SELECT
    e.EmployeeId
    ,e.FirstName
    ,e.LastName
FROM
    Employee e;

/*
Tasks:
(1) List all invoices (InvoiceId, CustomerId, InvoiceDate, Total).
(2) Add corresponding customer columns (FirstName, LastName, City).
(3) Filter to customers in London and Paris.
(4) Each customer has an employee assigned as a support rep. Add the corresponding employee names.
    Note that the common columns are Customer.SupportRepId and Employee.EmployeeId.
    As both Customer and Employee tables have FirstName and LastName columns, use column aliases to differentiate.
(5) Concatenate the employee FirstName and LastName into a single EmployeeName calculated column.
    Create a CustomerName column in the same way.
*/

-- Hint: use CONCAT(FirstName, ' ', LastName) to join two text columns with a space between them

-- Write your SQL code below here



SELECT i.InvoiceId,
       i.CustomerId,
       i.InvoiceDate,
       i.Total,
       CONCAT (e.FirstName, ' ', e.LastName) as EmployeeName
       c.City AS CustomerCity,
       CONCAT (c.FirstName, ' ', c.LastName) as CustomerName
       e.FirstName as CustomerFirstName,
       e.LastName AS CustomerLastName

FROM   Invoice AS i
       INNER JOIN 
       Customer AS C
       ON i.customerid = c.customerid
       join Employee as e on c.SupportRepId = e.EmployeeId
WHERE c.city in ('london','paris')


SELECT i.InvoiceId,
       i.CustomerId,
       i.InvoiceDate,
       i.Total,
       CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
       c.City,
       CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName
FROM   Invoice AS i JOIN Customer AS c ON i.CustomerId = c.CustomerId
JOIN Employee AS e ON c.SupportRepId = e.EmployeeId
WHERE c.City IN ('London', 'Paris')
 