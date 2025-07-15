-- Mart: Customer Summary
-- Customer-level summary with order count and total spend
SELECT
  c.customer_key,
  c.customer_name,
  COUNT(o.order_key) AS order_count,
  SUM(o.total_price) AS total_spend
FROM {{ ref('stg_customer') }} c
LEFT JOIN {{ ref('stg_orders') }} o ON c.customer_key = o.customer_key
GROUP BY c.customer_key, c.customer_name
