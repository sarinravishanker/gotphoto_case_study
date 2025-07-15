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
FROM {{ ref('int_customer_orders') }} o
LEFT JOIN {{ ref('stg_customer') }} c ON o.customer_key = c.customer_key
LEFT JOIN {{ ref('int_order_lineitems') }} l ON o.order_key = l.order_key
LEFT JOIN {{ ref('stg_part') }} p ON l.part_key = p.part_key;
