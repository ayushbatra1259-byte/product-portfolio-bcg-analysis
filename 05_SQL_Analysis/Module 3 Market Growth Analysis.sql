									--- Module 3: Market Growth Analysis ---

	--- Business Questions:
												-------------------------
--- 1. Which product categories have the highest market growth?

	--- Description:
	--- Comparing category-wise market size between 2024 and 2025 to identify the categories experiencing the highest market growth.

select
    p.Product_category,
    sum(m1.market_size) as current_market_size,
    sum(m2.market_size) as previous_market_size,

    round(
        (sum(m1.market_size) - sum(m2.market_size))
        / nullif(sum(m2.market_size), 0) * 100,
        2
    ) as market_growth_percentage

from product as p

join market_data as m1
    on p.product_id = m1.product_id

join market_data as m2
    on p.product_id = m2.product_id

where
    m1.year = 2025
    and m2.year = 2024

group by
    p.Product_category

order by
    market_growth_percentage desc;

--- Solution: Top 3 categories with high market growth
--- Baby Care - 11.48 ---
--- Personal Care - 10.22 ---
--- Food - 9.54 ---
												--------------------------

											
--- 2. Which products operate in rapidly expanding markets?

	--- Description:
    --- Comparing individual product market sizes between 2024 and 2025 to identify products operating in rapidly growing markets.

select
    p.product_name,
    p.product_category,

    m1.market_size as current_market_size,
    m2.market_size as previous_market_size,

    round(
        (m1.market_size - m2.market_size)
        / nullif(m2.market_size, 0) * 100,
        2
    ) as market_growth_percentage

from product as p

join market_data as m1
    on p.product_id = m1.product_id

join market_data as m2
    on p.product_id = m2.product_id

where
    m1.year = 2025
    and m2.year = 2024

    and m1.market_size > m2.market_size

order by
    market_growth_percentage desc

limit 10;

--- Solution: Top 3 products with high market growth(%)
--- EnergyRush Drink - 22.45 ---
--- BabyFresh Wipes - 22.22 ---
--- EnergyPlus Cereal - 21.43 ---
												-------------------------

--- 3. Which products operate in declining markets?

	--- Description:
    --- Comparing 2024 and 2025 market sizes to identify products whose respective markets have contracted.
    
select
    p.product_name,
    p.product_category,

    m1.market_size as current_market_size,
    m2.market_size as previous_market_size,

    round(
        (m1.market_size - m2.market_size)
        / nullif(m2.market_size, 0) * 100,
        2
    ) as market_growth_percentage

from product as p

join market_data as m1
    on p.product_id = m1.product_id

join market_data as m2
    on p.product_id = m2.product_id

where
    m1.year = 2025
    and m2.year = 2024

    and m1.market_size < m2.market_size

order by
    market_growth_percentage asc;

--- Solution: Product with declining market growth
--- CoolFizz Soda - -1.03 ---
													----------------------

--- 4. How does market growth differ across product categories?

	--- Description:
    --- Analysing category-wise market growth from 2021 to 2025 to understand long-term market expansion or contraction trends.
    
select
    p.product_category,

    round(avg(m.market_size), 2) as average_market_size,

    round(
        (
            sum(case when m.year = 2025 then m.market_size else 0 end)
            -
            sum(case when m.year = 2021 then m.market_size else 0 end)
        )
        /
        nullif(
            sum(case when m.year = 2021 then m.market_size else 0 end),
            0
        ) * 100,
        2
    ) as five_year_market_growth_percentage

from product as p

join market_data as m
    on p.product_id = m.product_id

group by
    p.Product_category

order by
    five_year_market_growth_percentage desc;

--- Solution: Market growth accross every product category for 5 yaers
--- Baby Care - 47.41 ---
--- Personal Care - 41.03 ---
--- Food - 36.49 ---
--- Home Care - 27.88 ---
--- Beverages - 19.06 ---
										------------------------

                                        