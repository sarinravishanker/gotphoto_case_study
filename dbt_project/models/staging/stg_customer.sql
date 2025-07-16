-- Dimension: Customer
SELECT
    c_custkey AS customer_key,
    c_name AS customer_name,
    c_address AS customer_address,
    c_nationkey AS nation_key,
    c_phone AS customer_phone,
    c_acctbal AS customer_acctbal,
    c_mktsegment AS customer_mktsegment,
    c_comment AS customer_comment
FROM {{ source('tpch_sf1', 'customer') }}
