									--- Module 5: BCG Matrix Clssification ---

	--- Description:
    --- Combining market growth and relative market share to classify each product as a Star, Cash Cow, Question Mark or Dog using the case when function.

	--- Assumptions:-
    --- For this analysis, we will compare 2025 with 2024 and use:
--- Market growth: 10% or above = High; below 10% = Low.
--- Relative market share: 1 or above = High; below 1 = Low.

									--- BCG Matrix Clssification---

select
    p.product_name,
    p.product_category,

    round(
        (m1.market_size - m2.market_size)
        / nullif(m2.market_size, 0) * 100,
        2
    ) as market_growth,

    round(
        m1.product_market_share /
        nullif(m1.competitor_market_share, 0),
        2
    ) as relative_market_share,

    case
        when
            (m1.market_size - m2.market_size)
            / nullif(m2.market_size, 0) * 100 >= 10
        then 'high'
        else 'low'
    end as growth_status,

    case
        when
            m1.product_market_share /
            nullif(m1.competitor_market_share, 0) >= 1
        then 'high'
        else 'low'
    end as market_share_status,

    case
        when
            (m1.market_size - m2.market_size)
            / nullif(m2.market_size, 0) * 100 >= 10
            and
            m1.product_market_share /
            nullif(m1.competitor_market_share, 0) >= 1
        then 'star'

        when
            (m1.market_size - m2.market_size)
            / nullif(m2.market_size, 0) * 100 < 10
            and
            m1.product_market_share /
            nullif(m1.competitor_market_share, 0) >= 1
        then 'cash cow'

        when
            (m1.market_size - m2.market_size)
            / nullif(m2.market_size, 0) * 100 >= 10
            and
            m1.product_market_share /
            nullif(m1.competitor_market_share, 0) < 1
        then 'question mark'

        else 'dog'
    end as bcg_classification

from product as p

join market_data as m1
    on p.product_id = m1.product_id

join market_data as m2
    on p.product_id = m2.product_id

where
    m1.year = 2025
    and m2.year = 2024

order by
    bcg_classification,
    market_growth desc;
