									--- Module 2: Product Profitability Analysis ---

	--- Business Questions:
												-------------------------
--- 1. Which products generate the highest gross profit?

	--- Description:
	--- Joining the product and sales table and also calculating the gross profit and ordering it in desc order to get the product having the gross profit

select
    p.product_name,
    sum(s.Revenue) as Total_Revenue,
    sum(s.cost) as Total_COGS,

    sum(s.revenue - s.cost) as Gross_Profit

from product as p

join sales as s
    on p.product_id = s.product_id

group by
    p.product_id,
    p.product_name

order by Gross_Profit desc

limit 5;

--- Solution: Top 3 highest gross profit product
--- VitaBoost Juice - 13037500.00 ---
--- EnergyRush Drink - 12957000.00 ---
--- ChocoBite Cookies - 11368000.00 ---
												--------------------------

											
--- 2. Which products have the highest gross profit margin?

	--- Description:
    --- Joining the product table and sales table and calculating the gross profit margin and then ordering it in desc order to get highest gross profit margin product

select
    p.product_name,

    sum(s.revenue) as Total_Revenue,

    sum(s.revenue - s.cost) as Gross_Profit,

    round(
        sum(s.revenue - s.cost)
        / nullif(sum(s.revenue), 0) * 100,
        2
    ) as Gross_Profit_Margin

from product as p

join sales as s
    on p.product_id = s.product_id

group by
    p.product_id,
    p.product_name

order by Gross_Profit_Margin desc

limit 5;

--- Solution: Top 3 highest gross profit margin product
--- FreshGlow Soap - 35.00 ---
--- BabyFresh Wipes - 35.00 ---
--- PureCare Face Wash - 35.00 ---
												-------------------------

--- 3. Which products generate high revenue but low profitability?

	--- Description:
    --- Joining the product and sales table and then calculating the total revenue and gross profit and using the having clause to apply condition as given in the question
    
select
    p.product_name,

    sum(s.revenue) as Total_Revenue,

    sum(s.revenue - s.cost) as Gross_Profit,

    round(
        sum(s.revenue - s.cost)
        / nullif(sum(s.revenue), 0) * 100,
        2
    ) as Gross_Profit_Margin

from product as p

join sales as s
    on p.product_id = s.product_id

group by
    p.product_id,
    p.product_name

having
    sum(s.revenue) >
    (
        select avg(product_revenue)
        from
        (
            select sum(revenue) as Product_Revenue
            from sales
            group by product_id
        ) as Revenue_Data
    )

and

    sum(s.revenue - s.cost)
    / nullif(sum(s.revenue), 0)
    <
    (
        select
            sum(revenue - cost)
            / nullif(sum(revenue), 0)
        from sales
    )

order by total_revenue desc;

--- Solution: 
--- AquaPure Detergent - 30.00 ---
--- BabySoft Diapers - 30.00 ---
--- GentleBaby Shampoo - 30.00 ---
													----------------------

--- 4. Which products have increasing production costs?

	--- Description:
    --- I will compare Current year COGS with Previous year COGS
    
select
    p.product_name,

    s1.year as current_year,

    s1.cost as current_year_cogs,

    s2.cost as previous_year_cogs,

    (
        s1.cost -
        s2.cost
    ) as cost_increase

from product as p

join sales as s1
    on p.product_id = s1.product_id

join sales as s2
    on s1.product_id = s2.product_id

where
    s1.year = s2.year + 1

and
    s1.cost > s2.cost

order by
    cost_increase desc;

--- Solution: top 3 product whose cost is increasing
--- EnergyRush Drink - 1950000.00 ---
--- FreshAir Room Spray - 1904000.00 ---
--- EnergyRush Drink - 1755000.00 ---

										------------------------

--- 5. Which products contribute the most to overall profit?

	--- Description:
    --- Calculating the gross profit contribution percentage
    
select
    p.product_name,

    sum(s.revenue - s.cost) as gross_profit,

    round(
        sum(s.revenue - s.cost)
        /
        (
            select sum(revenue - cost)
            from sales
        ) * 100,
        2
    ) as profit_contribution_percentage

from product as p

join sales as s
    on p.product_id = s.product_id

group by
    p.product_id,
    p.product_name

order by profit_contribution_percentage desc

limit 5;

--- Solution: top 3 highest profit contributor products
--- VitaBoost Juice - 7.53 ---
--- EnergyRush Drink - 7.49 ---
--- ChocoBite Cookies - 6.57 ---