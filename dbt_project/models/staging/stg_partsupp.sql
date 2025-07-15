-- Fact: Part Supplier
SELECT
  PS_PARTKEY AS part_key,
  PS_SUPPKEY AS supplier_key,
  PS_AVAILQTY AS avail_qty,
  PS_SUPPLYCOST AS supply_cost,
  PS_COMMENT AS partsupp_comment
FROM {{ source('tpch_sf1', 'partsupp') }}
