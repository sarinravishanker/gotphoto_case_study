-- Dimension: Region
SELECT
  R_REGIONKEY AS region_key,
  R_NAME AS region_name,
  R_COMMENT AS region_comment
FROM {{ source('tpch_sf1', 'region') }}
