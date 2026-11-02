# Product Portfolio & Investment Analysis Using BCG Matrix

**A SQL-based business analysis project to evaluate product performance, market growth, competitive positioning and investment opportunities.**

---

## 1. Project Overview

This project focuses on analysing the product portfolio of a fictional FMCG company, **Nova Consumer Products Ltd.**, using MySQL.

The objective is to evaluate product performance across multiple dimensions, including sales, profitability, market growth, relative market share and investment allocation.

The analysis applies the **Boston Consulting Group (BCG) Matrix** to classify products into four strategic categories: Stars, Cash Cows, Question Marks and Dogs.

The final objective is to translate SQL-based analysis into meaningful business insights and product-level investment recommendations.

## 2. Business Problem

Managing a diverse product portfolio requires understanding which products contribute to business performance, which markets offer growth opportunities and where investment should be prioritised.

The company needs to identify:

- Products generating strong revenue and profitability.
- Products operating in rapidly growing or declining markets.
- Products with strong or weak competitive positions.
- Products that require additional investment or strategic review.
- Opportunities to optimise investment allocation across the portfolio.

## 3. Project Objectives

- Analyse product-wise sales and profitability.
- Identify year-on-year revenue and cost trends.
- Evaluate market growth across product categories.
- Calculate relative market share to assess competitive positioning.
- Classify products using the BCG Matrix.
- Develop investment recommendations based on product performance and market opportunities.

## 4. Tools & Technologies

| Tool | Application |
|---|---|
| MySQL | Database management and SQL analysis |
| MySQL Workbench | SQL query execution and database management |
| Microsoft Excel | Data inspection and analytical result presentation |
| GitHub | Project documentation and version management |

## 5. Dataset Description

The project contains five interconnected datasets covering the period **2021–2025**.

| Dataset | Description |
|---|---|
| Products | Product names, categories and launch information |
| Sales | Revenue, units sold and cost of goods sold (COGS) |
| Market Data | Market size, product market share and competitor market share |
| Investments | Marketing, research and development, and capital investment |
| Product Targets | Target revenue and target sales quantities |

**Dataset note:** The project uses simulated data created for educational and analytical purposes. It does not represent actual company performance.

## 6. Database Design

A relational MySQL database was developed using five interconnected tables.

- `products`
- `sales`
- `market_data`
- `investments`
- `product_targets`

Primary keys and foreign keys were used to establish one-to-many relationships between the product table and the four related data tables.

This structure enables integrated product-level and annual analysis.

## 7. Data Preparation

Data preparation and validation checks include:

- Inspecting table structures and data types.
- Identifying missing values.
- Checking duplicate product-year records.
- Identifying invalid or unexpected numerical values.
- Validating primary key and foreign key relationships.
- Checking annual record consistency.
- Verifying financial calculations and market-share percentages.

## 8. SQL Analysis – Analytical Modules

The project is organised into five analytical modules.

### Module 1: Sales Performance Analysis
- Product-wise revenue contribution.
- Year-on-year revenue growth.
- Identification of top-performing products.
- Sales performance trends.

### Module 2: Profitability Analysis
- Gross profit calculation.
- Gross profit margin analysis.
- Identification of high-revenue, low-margin products.
- Year-on-year COGS comparison.
- Product contribution to overall gross profit.

### Module 3: Market Growth Analysis
- Category-wise market growth.
- Identification of products operating in expanding markets.
- Identification of products operating in declining markets.
- Comparison of market growth across categories.

### Module 4: Relative Market Share Analysis
- Product-wise relative market share calculation.
- Evaluation of competitive positioning.
- Category-wise competitive strength.
- Comparison of relative market share across years.

### Module 5: BCG Matrix Classification
Products are classified using market growth and relative market share.

The project uses the following classification thresholds:

- Market Growth: 10% or above = High; below 10% = Low.
- Relative Market Share: 1 or above = High; below 1 = Low.

The `CASE WHEN` function is used to automate product classification.

## 9. BCG Matrix Classification

The BCG Matrix categorises products into four strategic groups.

| BCG Category | Market Growth | Relative Market Share | Strategic Direction |
|---|---|---|---|
| Stars | High | High | Invest to sustain growth and leadership |
| Cash Cows | Low | High | Maintain position and generate cash |
| Question Marks | High | Low | Evaluate selective investment opportunities |
| Dogs | Low | Low | Review profitability and strategic relevance |

## 10. Investment Recommendations

Investment recommendations are developed using the BCG classification and supporting financial and market indicators.

- **Stars:** Prioritise investment to maintain market leadership and capture growth opportunities.
- **Cash Cows:** Focus on operational efficiency and profitability while maintaining market position.
- **Question Marks:** Evaluate growth potential and competitive opportunities before committing additional resources.
- **Dogs:** Review product profitability, costs and strategic relevance before deciding whether to maintain, reposition or discontinue the product.

## 11. Key Findings

This section presents the important findings obtained from the SQL analysis, including:

- Top revenue-generating products.
- Products with strong and weak profitability.
- Categories experiencing the highest market growth.
- Products with strong competitive positioning.
- Product distribution across BCG categories.
- Products requiring investment prioritisation or strategic review.

*Actual findings and supporting figures will be added after completing the analysis.*

## 12. Project Deliverables

The repository includes:

- SQL scripts for database creation and analysis.
- Dataset files.
- Database design and ER diagram.
- Data preparation and validation queries.
- BCG classification results.
- Investment recommendations.
- Final project presentation.

## 13. Conclusion

This project demonstrates how SQL can be used to transform structured business data into actionable insights.

By combining sales performance, profitability, market growth and competitive positioning, the BCG Matrix provides a strategic framework for evaluating product portfolios and supporting investment decisions.

The project reflects the application of financial analysis, database management and business-oriented problem-solving.

---

**Developed by:** Ayush Batra  
**Project:** Product Portfolio & Investment Analysis Using BCG Matrix  
**Domain:** Finance & Business Analytics  
**Tools:** MySQL | Excel | GitHub

