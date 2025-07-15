-- Dimension: Customer
SELECT
  C_CUSTKEY AS customer_key,
  C_NAME AS customer_name,
  C_ADDRESS AS customer_address,
  C_NATIONKEY AS nation_key,
  C_PHONE AS customer_phone,
  C_ACCTBAL AS customer_acctbal,
  C_MKTSEGMENT AS customer_mktsegment,
  C_COMMENT AS customer_comment
FROM {{ source('tpch_sf1', 'customer') }}
