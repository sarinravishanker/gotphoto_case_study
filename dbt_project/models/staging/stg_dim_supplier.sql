-- Dimension: Supplier
SELECT
    s_suppkey AS supplier_key,
    s_name AS supplier_name,
    s_address AS supplier_address,
    s_nationkey AS nation_key,
    s_phone AS supplier_phone,
    s_acctbal AS supplier_acctbal,
    s_comment AS supplier_comment
FROM {{ source('tpch_sf1', 'supplier') }}
