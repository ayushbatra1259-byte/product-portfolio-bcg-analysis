															--- TABLE CREATION ---

		-- Product Table

create table Product
	(
	Product_id int not null primary key,
	Product_name varchar(100),
	Product_category varchar(50),
	launch_date date
	);



		-- Sales Table 

create table Sales
	(
	Sales_id int not null primary key,
	Product_id int not null,
    Year year,
	Unit_Sold int,
	Revenue decimal(15,2),
    Cost decimal(15,2)
	);
    

    
    		-- Market_data Table 

create table Market_data
	(
	Market_id int not null primary key,
    Product_id int,
    Year year,
    Market_size decimal(5,2),
    Product_market_share decimal(5,2),
    Competitor_market_share decimal(5,2)
	);
    

    
    		-- Investment Table 

create table Investments
	(
	Investment_id int not null primary key,
    Product_id int,
    Year year,
    Marketing_expences decimal(15,2),
    Research_development decimal(15,2),
    Capital_investment decimal(15,2)
	);



    		-- Product Target Table 

create table Product_target
	(
	Target_id int not null primary key,
    producrt_id int,
    Year year,
    Target_revenue decimal(15,2),
    Target_units int
	);
    






---- Show Tables ---

show tables;


--- Describe Each Tables ---

describe product;
describe sales;
describe market_data;
describe investments;
describe product_target;