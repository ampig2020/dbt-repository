{{ config(materialized='table') }}

WITH source_customer AS (
    SELECT
        C_ACCTBAL,
        C_ADDRESS,
        C_COMMENT,
        C_CUSTKEY,
        C_MKTSEGMENT,
        C_NAME,
        C_NATIONKEY,
        C_PHONE
    FROM {{ source('tpch_sf100', 'customer') }}
)

SELECT *
FROM source_customer;