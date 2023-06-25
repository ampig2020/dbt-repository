-- models/apple_shop/materialized_source.sql
{{ config(materialized='table') }}

with source as (
    select * from {{ ref('int_preprocessing_apple_shop_customer') }}
)

select * from source
