											--- Data Validation ---

--- 1. Table structure verification using describe

describe product;

describe sales;

describe market_data;

describe investments;

describe product_target;


--- 2. Record count verification

select 'product' as table_name, count(*) as total_records
from product

union all

select 'sales', count(*)
from sales

union all

select 'market_data', count(*)
from market_data

union all

select 'investments', count(*)
from investments

union all

select 'product_targets', count(*)
from product_target;     


--- 3. Duplicate primary key checks

select product_id, count(*) as duplicate_count
from product
group by product_id
having count(*) > 1;

select sales_id, count(*) as duplicate_count
from sales
group by sales_id
having count(*) > 1;

select market_id, count(*) as duplicate_count
from market_data
group by market_id
having count(*) > 1;

select investment_id, count(*) as duplicate_count
from investments
group by investment_id
having count(*) > 1;

select target_id, count(*) as duplicate_count
from product_target
group by target_id
having count(*) > 1;    


--- 4. NULL value identification

select
    sum(product_id is null) as null_product_id,
    sum(product_name is null) as null_product_name,
    sum(Product_category is null) as null_category,
    sum(launch_date is null) as null_launch_year
from product;

select
    sum(sales_id is null) as null_sales_id,
    sum(product_id is null) as null_product_id,
    sum(year is null) as null_year,
    sum(unit_sold is null) as null_units_sold,
    sum(revenue is null) as null_revenue,
    sum(cost is null) as null_cogs
from sales;

select
    sum(market_id is null) as null_market_id,
    sum(product_id is null) as null_product_id,
    sum(year is null) as null_year,
    sum(market_size is null) as null_market_size,
    sum(product_market_share is null) as null_product_share,
    sum(competitor_market_share is null) as null_competitor_share
from market_data;

select
    sum(investment_id is null) as null_investment_id,
    sum(product_id is null) as null_product_id,
    sum(year is null) as null_year,
    sum(marketing_expense is null) as null_marketing,
    sum(research_development is null) as null_r_and_d,
    sum(capital_investment is null) as null_capital
from investments;

select
    sum(target_id is null) as null_target_id,
    sum(product_id is null) as null_product_id,
    sum(year is null) as null_year,
    sum(target_revenue is null) as null_target_revenue,
    sum(target_units is null) as null_target_units
from product_target;      


--- 5. Foreign key relationship checks

select sales.*
from sales
left join product
    on sales.product_id = product.product_id
where product.product_id is null;        

select market_data.*
from market_data
left join product
    on market_data.product_id = product.product_id
where product.product_id is null;  

select investments.*
from investments
left join product
    on investments.product_id = product.product_id
where product.product_id is null;        

select product_target.*
from product_target
left join product
    on product_target.product_id = product.product_id
where product.product_id is null;



--- 6. Year-wise data consistency checks

select year, count(*) as total_records
from sales
group by year
order by year;

select year, count(*) as total_records
from market_data
group by year
order by year;

select year, count(*) as total_records
from investments
group by year
order by year;

select year, count(*) as total_records
from product_target
group by year
order by year;