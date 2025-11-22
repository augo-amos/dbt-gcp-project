{{ config(materialized='table') }}

WITH stg_customers AS (
    SELECT customer_id,
    CONCAT(first_name, ' ', last_name) AS customer_name,
    email AS meail_address,
    address AS billing_address
    FROM raw.customers
)
SELECT * FROM stg_customers