{{ config(
    materialized='incremental',
    unique_key=['L_ORDERKEY', 'L_LINENUMBER'],
    incremental_strategy='append',
    cluster_by=['YEAR(commit_date)']
) }}

SELECT
  L_ORDERKEY AS order_key,
  L_PARTKEY AS part_key,
  L_SUPPKEY AS supplier_key,
  L_LINENUMBER AS line_number,
  L_QUANTITY AS quantity,
  L_EXTENDEDPRICE AS extended_price,
  L_DISCOUNT AS discount,
  L_TAX AS tax,
  L_RETURNFLAG AS return_flag,
  L_LINESTATUS AS line_status,
  L_SHIPDATE AS ship_date,
  L_COMMITDATE AS commit_date,
  L_RECEIPTDATE AS receipt_date,
  L_SHIPINSTRUCT AS ship_instruct,
  L_SHIPMODE AS ship_mode,
  L_COMMENT AS lineitem_comment
FROM {{ source('tpch_sf1', 'lineitem') }}
{% if is_incremental() %}
  WHERE (L_ORDERKEY, L_LINENUMBER) NOT IN (SELECT order_key, line_number FROM {{ this }})
{% endif %}
