-- models/marts/active_customers.sql
{{
  config(materialized='table')
}}

{{ get_customers_by_tier(min_spend=50) }}