-- Exercise 1: Subquery 
-- Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'. 
SELECT t1.Name
FROM Product t1
JOIN productsubcategory t2 ON t1.ProductSubcategoryID = t2.ProductSubcategoryID
WHERE (t2.Name) = 'Saddles';

--  Question 2: Thay đổi câu Query 1 để lấy được kết quả sau. 
SELECT t1.Name
FROM Product t1
JOIN productsubcategory t2 ON t1.ProductSubcategoryID = t2.ProductSubcategoryID
WHERE t2.Name LIKE 'Bo%';

-- Question 3: Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike (nghĩa là ProductSubcategoryID = 3) 
SELECT t1.Name
FROM Product t1
JOIN productsubcategory t2 ON t1.ProductSubcategoryID = t2.ProductSubcategoryID
WHERE t1.Listprice = (SELECT MIN(t1.Listprice) FROM `Product`) AND t1.ProductSubcategoryID = 3 AND t1.Name LIKE '%3000%'
GROUP BY t1.Name;

-- Exercise 2: JOIN nhiều bảng
--   Question 1: Viết query lấy danh sách tên country và province được lưu  trong AdventureWorks2008sample database. 
SELECT t1.Name AS 'country',t2.Name AS 'province'
FROM countryregion t1
LEFT JOIN stateprovince t2 ON t1.CountryRegionCode = t2.CountryRegionCode
LEFT JOIN address t3 ON t2.StateProvinceID = t3.StateProvinceID
GROUP BY t2.Name;

-- Question 2: Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada 
SELECT t1.Name AS 'country',t2.Name AS 'province'
FROM countryregion t1
LEFT JOIN stateprovince t2 ON t1.CountryRegionCode = t2.CountryRegionCode
LEFT JOIN address t3 ON t2.StateProvinceID = t3.StateProvinceID
WHERE t1.CountryRegionCode IN ( 'DE','CA')
GROUP BY t2.Name;

-- Question 3: 
SELECT t1.SalesOrderID,t1.OrderDate,t2.SalesPersonID,t2.SalesPersonID AS ' BusinessEntityID',t2.Bonus,t2.SalesYTD
FROM salesorderheader t1
JOIN salesperson t2 ON t1.SalesPersonID = t2.SalesPersonID
WHERE t1.OnlineOrderFlag = 1 AND t1. SalesPersonID IS NULL;

-- Question 4:  Sử dụng câu query, thêm cột JobTitle and xóa cột SalesPersonID và BusinessEntityID. 
SELECT t1.SalesOrderID,t1.OrderDate,t3.Title AS 'Jobtittle',t2.SalesPersonID AS ' BusinessEntityID',t2.Bonus,t2.SalesYTD
FROM salesorderheader t1
JOIN salesperson t2 ON t1.SalesPersonID = t2.SalesPersonID
JOIN employee t3 ON 









 















