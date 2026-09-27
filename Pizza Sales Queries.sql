#KPI'S
#1.Total Revenue
select SUM(total_price) as Total_Revenue from pizza_sales;

#2.Average Order Value
select (SUM(total_price) / COUNT(DISTINCT(order_id))) as Avg_Order_Value from pizza_sales;

#3.Total Pizzas Sold
select SUM(quantity) as Total_Pizzas_Sold from pizza_sales;

#4.Total Orders
select count(DISTINCT order_id) as Total_Orders from pizza_sales;

#5.Average Pizzas Per Order
select CAST(CAST(sum(quantity) AS DECIMAL(10,2)) / 
CAST(count(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) as Avg_Pizzas_Per_Order from pizza_sales;

#6.Daily Trends for Total Orders
SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);

#7.Hourly Trend for Total Orders
select hour(order_time) as Order_Hours , count(DISTINCT order_id) as Total_Orders
from pizza_sales
group by hour(order_time) 
order by hour(order_time);

#8.Percentage of Sales by Pizza Category
select pizza_category , cast(sum(total_price) as DECIMAL(10,2)) as Total_Sales, cast(sum(total_price)*100 / 
(select sum(total_price) from pizza_sales) as DECIMAL(10,2)) as PCT
from pizza_sales
group by pizza_category;

#9.Percentage of Sales by Pizza Size
select pizza_size, cast(sum(total_price) as DECIMAL(10,2)) as Total_Sales , cast(sum(total_price)*100 / 
(select sum(total_price) from pizza_sales) as DECIMAL(10,2)) as PCT
from pizza_sales
group by pizza_size
order by pizza_size;

#10.Total Pizzas Sold by Pizza Category
select pizza_category , sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_category
order by Total_Pizzas_Sold  desc;

#11.Top 5 Best Sellers by Total Pizzas Sold
select pizza_name , sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_name
order by Total_Pizzas_Sold desc
limit 5;

#12.Bottom 5 worst sellers by Total Pizzas Sold
select pizza_name , sum(quantity) as Total_Pizzas_Sold
from pizza_sales
group by pizza_name
order by Total_Pizzas_Sold ASC
limit 5;


