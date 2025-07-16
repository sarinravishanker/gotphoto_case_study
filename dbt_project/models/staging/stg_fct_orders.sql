{{ config(
    materialized='incremental',
    unique_key='O_ORDERKEY',
    incremental_strategy='append',
    cluster_by=["YEAR(order_date)"]
) }}

SELECT
    o_orderkey AS order_key,
    o_custkey AS customer_key,
    o_orderstatus AS order_status,
    o_totalprice AS total_price,
    o_orderdate AS order_date,
    o_orderpriority AS order_priority,
    o_clerk AS clerk,
    o_shippriority AS ship_priority,
    o_comment AS order_comment
FROM {{ source('tpch_sf1', 'orders') }}
{% if is_incremental() %}
    WHERE o_orderkey > (SELECT MAX(order_key) FROM {{ this }})
{% endif %}
