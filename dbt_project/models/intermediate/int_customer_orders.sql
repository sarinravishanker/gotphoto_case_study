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
FROM {{ ref('stg_customer') }} c
LEFT JOIN {{ ref('stg_orders') }} o
  ON c.customer_key = o.customer_key
