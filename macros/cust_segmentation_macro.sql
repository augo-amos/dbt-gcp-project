{% macro segment_customers() %}
    select
        c.customer_id,
        c.customer_name,
        count(o.order_id) as order_count,
        sum(o.total_amount) as total_spent,
        max(o.order_date) as last_order_date,
        case 
            when sum(o.total_amount) >= 500 then 'VIP'
            when sum(o.total_amount) >= 100 then 'Regular' 
            else 'New'
        end as customer_tier
    from {{ ref('stg_customers') }} c
    left join {{ ref('stg_orders') }} o using(customer_id)
    group by 1, 2
{% endmacro %}