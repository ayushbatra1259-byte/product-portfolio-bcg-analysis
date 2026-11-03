									--- Module 4: Relative Market Share Analysis ---

	--- Description:
    --- Analysing product-wise relative market share to evaluate competitive strength and identify products with stronger or weaker market positions.


									--- Relative market share for each product ---

select
    p.product_name,
    p.product_category,
    m.year,
    m.product_market_share,
    m.competitor_market_share,

    round(
        m.product_market_share /
        nullif(m.competitor_market_share, 0),
        2
    ) as relative_market_share

from product as p

join market_data as m
    on p.product_id = m.product_id

where m.year = 2025

order by relative_market_share desc;

--- Solution: market share for each product is as follows

--- BabySoft Diapers - 1.80
--- FreshGlow Soap - 1.75
--- NutriCrunch Biscuits - 1.73
--- PureCare Face Wash - 1.67
--- BabyFresh Wipes - 1.67
--- GreenLeaf Tea - 1.60
--- HerbalFresh Toothpaste - 1.52
--- GentleBaby Shampoo - 1.50
--- EnergyPlus Cereal - 1.47
--- EnergyRush Drink - 1.44
--- AquaPure Detergent - 1.42
--- ChocoBite Cookies - 1.40
--- FreshAir Room Spray - 0.67
--- SilkTouch Shampoo - 0.64
--- TinyCare Baby Lotion - 0.60
--- UltraWash Liquid - 0.54
--- VitaBoost Juice - 0.50
--- GoldenHarvest Noodles - 0.48
--- SparkClean Floor Cleaner - 0.43
--- CoolFizz Soda - 0.38

