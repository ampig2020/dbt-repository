with source as (
    select * from {{ ref('stg_apple_shop_customers') }}
)
select * from source



-- Removing Duplicates Transformation
-- with source as (
--     select * from {{ ref('stg_apple_shop_customers') }}
-- ),
-- deduplicated as (
--     select distinct * from source
-- )
-- select * from deduplicated

-- Handle NULL values
-- with source as (
--     select 
--         coalesce(customer_id, 'UNKNOWN') as customer_id,
--         coalesce(customer_country, 'UNKNOWN') as customer_country,
--         -- repeat for other columns
--     from {{ ref('stg_apple_shop_customers') }}
-- )
-- select * from source

-- Format standardization
-- with source as (
--     select 
--         customer_id,
--         to_date(customer_birthdate, 'YYYY-MM-DD') as customer_birthdate, -- standardize date format
--         -- repeat for other columns
--     from {{ ref('stg_apple_shop_customers') }}
-- )
-- select * from source

-- -- Trimming strings
-- with source as (
--     select 
--         trim(customer_id) as customer_id,
--         trim(customer_country) as customer_country,
--         -- repeat for other columns
--     from {{ ref('stg_apple_shop_customers') }}
-- )
-- select * from source

--Validation
-- with source as (
--     select * 
--     from {{ ref('stg_apple_shop_customers') }}
--     where 
--         customer_birthdate <= current_date and 
--         customer_email like '%@%.%' -- simple email validation
-- )
-- select * from source




