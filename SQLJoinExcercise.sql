/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT P.Name as Product, C.Name as Category 
 FROM products as P
 INNER JOIN categories AS C on C.CategoryID = P.CategoryID
 WHERE C.Name = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, products.Price, reviews.Rating
 from products
 INNER JOIN reviews on reviews.ProductID = products.ProductID 
 WHERE Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.Quantity) AS Total FROM sales as s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total Desc;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name as 'Department Name', c.Name as 'Category Name' FROM departments as d
INNER JOIN categories as c on c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.NAME, SUM(s.Quantity)  as 'Total Sold' , SUM(s.PricePerUnit * s.PricePerUnit) as 'Total Price' from products as P
INNER JOIN sales as s on p.ProductID = s.ProductID
WHERE p.ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.NAME as 'Product Name', r.Reviewer as 'Reviewer Name',  MIN(r.Rating) as 'Rating', r.Comment as 'Comment' from products as p
INNER JOIN reviews as r on p.ProductID = r.ProductID
WHERE p.ProductID = 857 and r.Rating = 1
GROUP BY p.ProductID;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) as TotalSold
FROM Sales as s
INNER JOIN employees as e on e.EmployeeID = s.EmployeeID
INNER JOIN products as p on p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY e.FirstName;