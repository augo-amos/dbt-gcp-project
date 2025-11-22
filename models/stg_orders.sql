{{ config(materialized='table') }}

SELECT
    o.order_id,
    o.customer_id,
    c.customer_name,
    o.total_amount,
    o.order_date
FROM raw.orders AS o
JOIN 
    {{ ref('stg_customers') }} AS c
    ON o.customer_id=c.customer_id