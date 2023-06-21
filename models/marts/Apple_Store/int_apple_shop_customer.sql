with source as (
    select * from {{ ref('stg_apple_shop_customers') }}
)
select * from source
