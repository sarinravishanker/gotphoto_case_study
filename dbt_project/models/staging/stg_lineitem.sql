{{ config(
    materialized='incremental',
    unique_key=['L_ORDERKEY', 'L_LINENUMBER'],
    incremental_strategy='append',
    cluster_by=['YEAR(commit_date)']
) }}

SELECT
    l_orderkey AS order_key,
    l_partkey AS part_key,
    l_suppkey AS supplier_key,
    l_linenumber AS line_number,
    l_quantity AS quantity,
    l_extendedprice AS extended_price,
    l_discount AS discount,
    l_tax AS tax,
    l_returnflag AS return_flag,
    l_linestatus AS line_status,
    l_shipdate AS ship_date,
    l_commitdate AS commit_date,
    l_receiptdate AS receipt_date,
    l_shipinstruct AS ship_instruct,
    l_shipmode AS ship_mode,
    l_comment AS lineitem_comment
FROM {{ source('tpch_sf1', 'lineitem') }}
{% if is_incremental() %}
    WHERE (l_orderkey, l_linenumber) NOT IN (SELECT
        order_key,
        line_number
    FROM {{ this }})
{% endif %}
