-- models/marts/customer_tiers.sql
{{
  config(materialized='table')
}}

{{ segment_customers() }}