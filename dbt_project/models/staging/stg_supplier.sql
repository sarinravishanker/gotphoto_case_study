-- Dimension: Supplier
SELECT
  S_SUPPKEY AS supplier_key,
  S_NAME AS supplier_name,
  S_ADDRESS AS supplier_address,
  S_NATIONKEY AS nation_key,
  S_PHONE AS supplier_phone,
  S_ACCTBAL AS supplier_acctbal,
  S_COMMENT AS supplier_comment
FROM {{ source('tpch_sf1', 'supplier') }}
