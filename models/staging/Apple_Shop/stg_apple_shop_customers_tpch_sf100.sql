with source_customer as (
    select *,
        CAST(null AS NUMBER) AS C_ACCTBAL,
        CAST(null AS VARCHAR) AS C_ADDRESS,
        CAST(null AS VARCHAR) AS C_COMMENT,
        CAST(null AS NUMBER) AS C_CUSTKEY,
        CAST(null AS VARCHAR) AS C_MKTSEGMENT,
        CAST(null AS VARCHAR) AS C_NAME,
        CAST(null AS NUMBER) AS C_NATIONKEY,
        CAST(null AS VARCHAR) AS C_PHONE
    from {{ source('tpch_sf100', 'customer') }}
)
