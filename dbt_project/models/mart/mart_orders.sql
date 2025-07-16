-- Mart: Orders
-- Final orders mart with customer, lineitem, and part details
SELECT
    o.order_key,
    o.order_date,
    o.total_price,
    c.customer_name,
    l.line_number,
    l.part_key,
    l.quantity,
    l.extended_price,
    p.part_name,
    p.part_brand
FROM {{ ref('int_customer_orders') }} AS o
LEFT JOIN {{ ref('stg_dim_customer') }} AS c ON o.customer_key = c.customer_key
LEFT JOIN {{ ref('int_order_lineitems') }} AS l ON o.order_key = l.order_key
LEFT JOIN {{ ref('stg_dim_part') }} AS p ON l.part_key = p.part_key
