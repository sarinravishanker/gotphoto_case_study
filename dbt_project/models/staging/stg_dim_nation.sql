-- Dimension: Nation
SELECT
    n_nationkey AS nation_key,
    n_name AS nation_name,
    n_regionkey AS region_key,
    n_comment AS nation_comment
FROM {{ source('tpch_sf1', 'nation') }}
