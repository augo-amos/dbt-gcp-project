# E-Commerce Analytics on BigQuery

A modern data analytics platform built on Google BigQuery that transforms raw e-commerce data into actionable business intelligence.

## Overview

This project implements a complete e-commerce analytics solution using Google BigQuery, featuring customer segmentation, product performance analysis, and sales tracking. The data model supports 100+ customers, 150+ orders, and comprehensive business reporting.

## Data Architecture

### Core Tables
- **`customers`**: 100+ customer records with demographic and segmentation data
- **`products`**: 30+ products across electronics, furniture, and accessories
- **`orders`**: 150+ transactions with order details and status tracking
- **`order_items`**: Line-item details connecting orders to products

### Key Features
- **Customer Lifetime Value (CLV)**
- **RFM Segmentation** (Recency, Frequency, Monetary)
- **Product Performance Analytics**
- **Sales Trend Analysis**
- **Marketing Campaign Targeting**

## Technical Stack

- **Data Warehouse**: Google BigQuery
- **Data Modeling**: SQL-based transformations
- **Analytics**: Custom SQL queries and macros
- **Data Formats**: JSONL & CSV for data loading

## Business Insights

### Customer Segmentation
- **VIP Customers**: $1000+ lifetime spend
- **Premium**: $500-999 spend
- **Regular**: $100-499 spend
- **Activity Tiers**: Active, Warming, Cold, Dormant

### Key Metrics
- Customer acquisition trends
- Average order value (AOV)
- Monthly recurring revenue (MRR)
- Product category performance
- Customer retention rates

## Project Structure

```
models/
├── staging/
│   ├── stg_customers.sql
│   └── stg_orders.sql
├── marts/
│   ├── customer_segments.sql
│   ├── product_performance.sql
│   └── sales_analytics.sql
└── macros/
    └── customer_segmentation.sql
```

## Quick Start

1. **Load Data to BigQuery**
   ```sql
   -- Create dataset and load customer, product, order tables
   bq load --source_format=CSV your_dataset.customers customers.csv
   ```

2. **Run Core Analytics**
   ```sql
   -- Customer segmentation query
   SELECT * FROM `your-project.analytics.customer_segments`
   WHERE customer_tier = 'VIP';
   ```

3. **Generate Reports**
   ```sql
   -- Monthly sales performance
   SELECT * FROM `your-project.analytics.monthly_sales_trends`;
   ```

## Sample Queries

### Top Performing Products
```sql
SELECT 
  product_name,
  category,
  SUM(quantity) as units_sold,
  SUM(line_total) as revenue
FROM `your-project.analytics.order_items` oi
JOIN `your-project.analytics.products` p USING (product_id)
GROUP BY 1, 2
ORDER BY revenue DESC;
```

### Customer Retention Analysis
```sql
SELECT
  customer_tier,
  COUNT(*) as customer_count,
  AVG(total_spent) as avg_lifetime_value
FROM `your-project.analytics.customer_segments`
GROUP BY 1;
```

## Use Cases

- **Marketing**: Targeted campaign segmentation
- **Sales**: Customer prioritization and outreach
- **Product**: Inventory and category optimization
- **Executive**: Business performance dashboards

## Performance

- **Query Optimization**: Leveraging BigQuery's columnar storage
- **Data Freshness**: Daily updates via scheduled queries
- **Scalability**: Handles 100K+ records efficiently

## Contributing

This project demonstrates modern cloud data warehousing patterns and can be extended with:
- Real-time data streaming
- Machine learning predictions
- Advanced customer analytics
- Multi-channel attribution