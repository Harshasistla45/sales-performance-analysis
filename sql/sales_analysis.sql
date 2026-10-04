-- Sales Performance Analysis (MySQL)
-- Table used: sales_data

-- 1. Overall KPIs
SELECT SUM(Sales) AS total_sales FROM sales_data;
SELECT SUM(Profit) AS total_profit FROM sales_data;
SELECT SUM(Units_Sold) AS total_units_sold FROM sales_data;
SELECT SUM(Profit) / SUM(Sales) * 100 AS profit_margin FROM sales_data;

-- 2. Country performance
SELECT Country, SUM(Sales) AS total_sales
FROM sales_data
GROUP BY Country
ORDER BY total_sales DESC;

SELECT Country, SUM(Profit) AS total_profit
FROM sales_data
GROUP BY Country
ORDER BY total_profit DESC;

SELECT Country, SUM(Profit) / SUM(Sales) * 100 AS profit_margin
FROM sales_data
GROUP BY Country
ORDER BY profit_margin DESC;

SELECT Country, SUM(Discounts) / SUM(Sales) * 100 AS discount_percentage
FROM sales_data
GROUP BY Country
ORDER BY discount_percentage DESC;

SELECT Country, SUM(COGS) / SUM(Sales) * 100 AS cogs_percentage
FROM sales_data
GROUP BY Country
ORDER BY cogs_percentage DESC;

-- 3. Product performance
SELECT Product, SUM(Sales) AS total_sales
FROM sales_data
GROUP BY Product
ORDER BY total_sales DESC;

SELECT Product, SUM(Profit) AS total_profit
FROM sales_data
GROUP BY Product
ORDER BY total_profit DESC;

SELECT Product,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit,
       SUM(Profit) / SUM(Sales) * 100 AS profit_margin
FROM sales_data
GROUP BY Product
ORDER BY total_sales DESC;

SELECT Product, SUM(COGS) / SUM(Sales) * 100 AS cogs_percentage
FROM sales_data
GROUP BY Product;

SELECT Product, SUM(Discounts) / SUM(Sales) * 100 AS discount_percentage
FROM sales_data
GROUP BY Product;

-- 4. Segment performance
SELECT Segment,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit
FROM sales_data
GROUP BY Segment
ORDER BY total_profit DESC;

SELECT Segment,
       SUM(Profit) / SUM(Sales) * 100 AS profit_margin
FROM sales_data
GROUP BY Segment
ORDER BY profit_margin DESC;

SELECT Segment,
       SUM(COGS) / SUM(Sales) * 100 AS cogs_percentage
FROM sales_data
GROUP BY Segment;

-- 5. Time trends
SELECT Month_Name,
       Month_Number,
       SUM(Sales) AS monthly_sales
FROM sales_data
GROUP BY Month_Name, Month_Number
ORDER BY Month_Number;

SELECT Month_Name,
       Month_Number,
       SUM(Profit) AS monthly_profit
FROM sales_data
GROUP BY Month_Name, Month_Number
ORDER BY Month_Number;

SELECT Year,
       SUM(Sales) AS yearly_sales,
       SUM(Profit) AS yearly_profit
FROM sales_data
GROUP BY Year
ORDER BY Year;

-- 6. Discount analysis
SELECT Discount_Band, SUM(Sales) AS band_sales
FROM sales_data
GROUP BY Discount_Band;

SELECT Discount_Band, SUM(Profit) AS band_profit
FROM sales_data
GROUP BY Discount_Band;

SELECT Discount_Band,
       SUM(Profit) / SUM(Sales) * 100 AS profit_margin
FROM sales_data
GROUP BY Discount_Band;

-- 7. Weak-area detection
SELECT Product,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit,
       SUM(Profit) / SUM(Sales) * 100 AS profit_margin
FROM sales_data
GROUP BY Product
ORDER BY total_sales DESC;
