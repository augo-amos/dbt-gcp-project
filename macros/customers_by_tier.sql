{% macro get_customers_by_tier(min_spend=100) %}
    select
        c.customer_id,
        c.customer_name,
        sum(o.total_amount) as total_spent,
        case 
            when sum(o.total_amount) >= {{ min_spend }} then 'Qualified'
            else 'Below Threshold'
        end as status
    from {{ ref('stg_customers') }} c
    left join {{ ref('stg_orders') }} o using(customer_id)
    group by 1, 2
    having sum(o.total_amount) >= {{ min_spend }}
{% endmacro %}