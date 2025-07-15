-- Dimension: Nation
SELECT
  N_NATIONKEY AS nation_key,
  N_NAME AS nation_name,
  N_REGIONKEY AS region_key,
  N_COMMENT AS nation_comment
FROM {{ source('tpch_sf1', 'nation') }}
