-- Intermediate: Supplier Parts
-- Joins suppliers and partsupp for downstream marts
SELECT
    s.supplier_key,
    s.supplier_name,
    ps.part_key,
    ps.avail_qty,
    ps.supply_cost
FROM {{ ref('stg_dim_supplier') }} AS s
LEFT JOIN {{ ref('stg_fct_partsupp') }} AS ps
    ON s.supplier_key = ps.supplier_key
