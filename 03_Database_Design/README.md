# Database Design – Product Portfolio & Investment Analysis

## 1. Overview

The project uses a relational database developed in MySQL to organise and analyse product portfolio information for Nova Consumer Products Ltd.

The database consists of five interconnected tables covering product details, sales performance, market information, investment allocation and product targets.

The database covers the period 2021–2025.

## 2. Database Name

`product_portfolio_analysis`

## 3. Database Tables

### 3.1 Products

**Purpose:** Stores the master information of all products included in the analysis.

| Column | Data Type | Description |
|---|---|---|
| product_id | INT | Unique product identifier (Primary Key) |
| product_name | VARCHAR | Name of the product |
| category | VARCHAR | Product category |
| launch_year | YEAR | Product launch year |

### 3.2 Sales

**Purpose:** Stores annual sales and cost information for each product.

| Column | Data Type | Description |
|---|---|---|
| sales_id | INT | Unique sales record identifier (Primary Key) |
| product_id | INT | Product reference (Foreign Key) |
| year | YEAR | Sales year |
| units_sold | INT | Quantity sold |
| revenue | DECIMAL | Total product revenue |
| cost_of_goods_sold | DECIMAL | Cost of goods sold (COGS) |

### 3.3 Market Data

**Purpose:** Stores market size and market-share information for evaluating market growth and competitive positioning.

| Column | Data Type | Description |
|---|---|---|
| market_id | INT | Unique market record identifier (Primary Key) |
| product_id | INT | Product reference (Foreign Key) |
| year | YEAR | Market data year |
| market_size | DECIMAL | Total market size (₹ crore) |
| product_market_share | DECIMAL | Product market share (%) |
| competitor_market_share | DECIMAL | Largest competitor's market share (%) |

### 3.4 Investments

**Purpose:** Stores annual investment information for each product.

| Column | Data Type | Description |
|---|---|---|
| investment_id | INT | Unique investment record identifier (Primary Key) |
| product_id | INT | Product reference (Foreign Key) |
| year | YEAR | Investment year |
| marketing_expense | DECIMAL | Marketing expenditure |
| research_development | DECIMAL | Research and development expenditure |
| capital_investment | DECIMAL | Capital investment |

### 3.5 Product Targets

**Purpose:** Stores annual revenue and quantity targets for each product.

| Column | Data Type | Description |
|---|---|---|
| target_id | INT | Unique target record identifier (Primary Key) |
| product_id | INT | Product reference (Foreign Key) |
| year | YEAR | Target year |
| target_revenue | DECIMAL | Planned revenue |
| target_units | INT | Planned sales quantity |

## 4. Primary Key and Foreign Key Relationships

The `products` table acts as the central master table.

Its `product_id` column is the primary key and is referenced by the four related tables as a foreign key.

| Parent Table | Child Table | Relationship |
|---|---|---|
| products | sales | One-to-Many |
| products | market_data | One-to-Many |
| products | investments | One-to-Many |
| products | product_targets | One-to-Many |

### Relationship Explanation

A single product can have multiple records across different years in the sales, market, investment and target tables.

For example, one product can have separate records for 2021, 2022, 2023, 2024 and 2025.

This structure enables product-wise and year-wise analysis through SQL joins.

## 5. Database Relationships

```text
                 products
                (product_id)
                     |
          ___________|___________
         |           |           |
       sales     market_data  investments
         |
    product_targets
```

**Note:** All four related tables connect directly to `products` through `product_id`. They are not connected to each other.

## 6. Database Design Benefits

- Maintains structured and organised business data.
- Reduces unnecessary repetition of product master information.
- Establishes referential integrity through primary and foreign keys.
- Enables data integration using SQL joins.
- Supports annual product performance comparisons.
- Provides a foundation for BCG Matrix and investment analysis.

## 7. Conclusion

The relational database structure provides a foundation for analysing product performance across financial, market and investment dimensions.

By connecting five datasets through product identifiers, the database enables integrated analysis and supports strategic product portfolio decisions.

**Database:** MySQL  
**Database Name:** product_portfolio_analysis  
**Project:** Product Portfolio & Investment Analysis Using BCG Matrix

