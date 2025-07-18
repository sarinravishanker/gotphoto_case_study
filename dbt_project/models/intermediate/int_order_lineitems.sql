-- Intermediate: Order Lineitems
-- Joins orders and lineitems for downstream marts
SELECT
    o.order_key,
    o.customer_key,
    l.line_number,
    l.part_key,
    l.supplier_key,
    l.quantity,
    l.extended_price,
    l.discount,
    l.tax,
    l.ship_date
FROM {{ ref('stg_fct_orders') }} AS o
LEFT JOIN {{ ref('stg_fct_lineitem') }} AS l
    ON o.order_key = l.order_key
