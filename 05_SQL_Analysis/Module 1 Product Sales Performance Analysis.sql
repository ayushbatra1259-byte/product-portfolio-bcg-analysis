									--- Module 1: Product Sales Performance Analysis ---

	--- Business Questions:
												-------------------------
--- 1. Which products generate the highest revenue?

	--- Description:
	--- Joining the Product table and Sales Table and ordering it by revenue in desc order and limiting to 3 to know the top 3 highest revenue product

select 
product.Product_id, product.Product_name, product.Product_category, 
sales.Revenue
from product
join sales
	on product.Product_id = sales.Product_id
order by sales.Revenue desc
limit 3
;

--- Solution: The top 3 Products with their revenue are as follows
--- EnergyRush Drink - 12600000.00 ---
--- VitaBoost Juice - 10250000.00 ---
--- EnergyRush Drink - 9600000.00 ---
												--------------------------

											
--- 2. Which products contribute the most to total sales?

	--- Description:
    --- Joining the Product and sales table and calculating the revenue contribution in total sales leads to top 3 contributor products in total sales

select 
product.Product_id, product.Product_name, product.Product_category, 
sales.Revenue, 
ROUND(
        sales.Revenue / SUM(sales.Revenue) OVER() * 100, 
        2
    ) AS Contribution
from product
join sales
	on product.Product_id = sales.Product_id
order by sales.Revenue desc
limit 3
;

--- Solution: The top 3 contributors with their contribution in total sales are as follows
--- EnergyRush Drink - 2.39 ---
--- VitaBoost Juice - 1.94 ---
--- EnergyRush Drink - 1.82 ---
												-------------------------

--- 3. Which products have experienced declining sales?

	--- Description:
    --- Joining the Product table and Sales Table and ordering it by revenue in asc order and limiting to 3 to know the Bottom 3 Revenue Contributors
    
select 
product.Product_id, product.Product_name, product.Product_category, 
sales.Revenue
from product
join sales
	on product.Product_id = sales.Product_id
order by sales.Revenue asc
limit 3
;

--- Solution: The Bottom 3 Revenue Contributors with their revenue are as follows
--- EnergyPlus Cereal - 2250000.00 ---
--- BabyFresh Wipes - 2400000.00 ---
--- FreshAir Room Spray - 2500000.00 ---
													----------------------

--- 4. Which products have achieved the highest year-on-year growth?

	--- Description:
    --- Joining the product and sales table and then calculating the revenue year on year growth for each product 
    --- asuming 2025 as current year and 2024 as previous year
    
select
    p.product_name,
    sum(s.revenue) as current_year_revenue,

    (
        select sum(s2.revenue)
        from sales s2
        where s2.product_id = s.product_id
        and s2.year = 2024
    ) AS previous_year_revenue,

    round(
        (
            sum(s.revenue) -
            (
                select sum(s2.revenue)
                from sales s2
                where s2.product_id = s.product_id
                and s2.year = 2024
            )
        )
        /
        NULLIF(
            (
                select SUM(s2.revenue)
                from sales s2
                where s2.product_id = s.product_id
                and s2.year = 2024
            ), 0
        ) * 100, 2
    ) as yoy_growth_percentage

from product p
join sales s
    on p.product_id = s.product_id

where s.year = 2025

group by
    p.product_id,
    p.product_name

order by yoy_growth_percentage desc

limit 3;

--- Solution: The top 3 YOY growth Products asuming 2025 as current year and 2024 as previous year are as follows
--- EnergyPlus Cereal - 36.00 ---
--- EnergyRush Drink - 31.25 ---
--- FreshAir Room Spray - 30.43 ---

										------------------------
                                        