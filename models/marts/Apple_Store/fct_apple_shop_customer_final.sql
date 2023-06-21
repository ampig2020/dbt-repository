with source as (
    select * from {{ ref('int_preprocessing_apple_shop_customer') }}
)

select * from source