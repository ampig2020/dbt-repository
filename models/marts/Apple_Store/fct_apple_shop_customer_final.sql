
{{ config(materialized='table') }}

with source as (
    select * from {{ ref('int_preprocessing_apple_shop_customer') }}
)

select * from source


-- Check the number of rows for validation
-- select count(*) as row_count from source;

