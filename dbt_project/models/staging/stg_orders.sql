{{ config(
    materialized='incremental',
    unique_key='O_ORDERKEY',
    incremental_strategy='append',
    cluster_by=["YEAR(order_date)"]
) }}

SELECT
  O_ORDERKEY AS order_key,
  O_CUSTKEY AS customer_key,
  O_ORDERSTATUS AS order_status,
  O_TOTALPRICE AS total_price,
  O_ORDERDATE AS order_date,
  O_ORDERPRIORITY AS order_priority,
  O_CLERK AS clerk,
  O_SHIPPRIORITY AS ship_priority,
  O_COMMENT AS order_comment
FROM {{ source('tpch_sf1', 'orders') }}
{% if is_incremental() %}
  WHERE O_ORDERKEY > (SELECT max(order_key) FROM {{ this }})
{% endif %}
