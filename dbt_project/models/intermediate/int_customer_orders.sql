-- Intermediate: Customer Orders
-- Joins customers and orders for downstream marts
SELECT
    c.customer_key,
    c.customer_name,
    c.nation_key,
    o.order_key,
    o.order_status,
    o.total_price,
    o.order_date
FROM {{ ref('stg_dim_customer') }} AS c
LEFT JOIN {{ ref('stg_fct_orders') }} AS o
    ON c.customer_key = o.customer_key
