-- Dimension: Region
SELECT
    r_regionkey AS region_key,
    r_name AS region_name,
    r_comment AS region_comment
FROM {{ source('tpch_sf1', 'region') }}
