-- Fact: Part Supplier
SELECT
    ps_partkey AS part_key,
    ps_suppkey AS supplier_key,
    ps_availqty AS avail_qty,
    ps_supplycost AS supply_cost,
    ps_comment AS partsupp_comment
FROM {{ source('tpch_sf1', 'partsupp') }}
