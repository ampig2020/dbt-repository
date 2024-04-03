-- models/flatten_categories.sql

{{ config(
    materialized='view',
    schema='DL1_DATABASE.PROD_DL1_CHIEF_FINANCIAL_OFFICE_RQ',
    database='DL1_DATABASE'
) }}

WITH source_data AS (
    SELECT
        *
    FROM
        {{ source('DL0_DATABASE', 'PROD_DL0_CHIEF_FINANCIAL_OFFICE_RQ_raw__stream_categories') }}
)

SELECT
    _airbyte_raw_id as,
    _airbyte_extracted_at as,
    _airbyte_loaded_at as,
    COALESCE(
        TRIM(CAST(JSON_VALUE(__airbyte_data, '$.name') AS VARCHAR)),
        CAST(NULL AS VARCHAR)
    ) AS category_name
FROM
    source_data