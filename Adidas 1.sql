select * from ['Adidas sales data$']

---Total sales by each product

SELECT [Product], SUM([Total Sales]) AS TotalSales
FROM ['Adidas sales data$']
GROUP BY Product
ORDER BY [TotalSales] DeSC


------Total unit sold

SELECT sum([Units Sold]) as Total_unitsold
FROM ['Adidas sales data$']


---Average price per unit

SELECT AVG([Price per Unit]) AS average_price
FROM ['Adidas sales data$']


-----Average price per unit of each product

SELECT [Product], AVG([price per unit]) AS average_price
FROM ['Adidas sales data$']
GROUP BY [Product]


----Units sold by each product

SELECT [Product], SUM([Units Sold]) AS TotalUnitsSold
FROM ['Adidas sales data$']
GROUP BY [Product]
ORDER BY [TotalUnitsSold] DESC


----Total sales by year, quarter and month

SELECT DATEPART(year, [Invoice Date]) AS Year, SUM([Total Sales]) AS TotalSales
FROM ['Adidas sales data$']
GROUP BY DATEPART(year, [Invoice Date])


SELECT DATEPART(year, [Invoice Date]) AS Year, DATEPART(quarter, [Invoice Date]) AS Quarter, SUM([Total Sales]) AS TotalSales
FROM ['Adidas sales data$']
GROUP BY DATEPART(year, [Invoice Date]), DATEPART(quarter, [Invoice Date])
ORDER BY TotalSales DESC


SELECT DATEPART(year, [Invoice Date]) AS Year, DATEPART(month, [Invoice Date]) AS Month, SUM([Total Sales]) AS TotalSales
FROM ['Adidas sales data$']
GROUP BY DATEPART(year, [Invoice Date]), DATEPART(month, [Invoice Date])
ORDER BY TotalSales DESC


--------------------OR-------------------------

SELECT DATEPART(year, [Invoice Date]) AS Year, DATEPART(quarter, [Invoice Date]) AS Quarter, DATEPART(month, [Invoice Date]) AS Month, SUM([Total Sales]) AS TotalSales
FROM ['Adidas sales data$']
GROUP BY DATEPART(year, [Invoice Date]), DATEPART(quarter, [Invoice Date]), DATEPART(month, [Invoice Date])
ORDER BY TotalSales DESC


-----Percentage of sales by Year

SELECT YEAR([Invoice Date]) AS Year, 
       SUM([Total Sales]) AS TotalSales,
       SUM([Total Sales])/(SELECT SUM([Total Sales]) FROM ['Adidas sales data$'])*100 AS PercentageSales
FROM ['Adidas sales data$']
GROUP BY YEAR([Invoice Date])
ORDER BY Year


---Top 10 State by sales.

SELECT TOP 10 [State], SUM([Total Sales]) AS total_sales
FROM ['Adidas sales data$']
GROUP BY [State]
ORDER BY total_sales DESC


-----Highest and lowest sales

SELECT MAX([Total Sales]) AS highest_sales, MIN([Total Sales]) AS lowest_sales
FROM ['Adidas sales data$']


-----Retailer with the highest sales

SELECT TOP 1 [Retailer], SUM([Total Sales]) AS TotalSales
FROM ['Adidas sales data$']
GROUP BY [Retailer]
ORDER BY TotalSales DESC


-----Highest selling product

SELECT TOP 1 [Product], SUM([Units Sold]) as highest_sellingproduct
FROM ['Adidas sales data$']
GROUP BY [Product]
ORDER BY highest_sellingproduct DESC
