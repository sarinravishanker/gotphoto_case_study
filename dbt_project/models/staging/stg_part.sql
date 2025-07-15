-- Dimension: Part
SELECT
  P_PARTKEY AS part_key,
  P_NAME AS part_name,
  P_MFGR AS part_mfgr,
  P_BRAND AS part_brand,
  P_TYPE AS part_type,
  P_SIZE AS part_size,
  P_CONTAINER AS part_container,
  P_RETAILPRICE AS part_retailprice,
  P_COMMENT AS part_comment
FROM {{ source('tpch_sf1', 'part') }}
