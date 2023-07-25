with 
source as (
    select * from {{ ref('int_apple_shop_customer') }}
),

cleaned as (
    select
        -- Format the birth year by removing commas
        replace(customer_birthyear, ',', '')::integer as C_BIRTH_YEAR_CLEANED,
        -- Convert country name to abbreviation using the macro
        {{ country_to_abbreviation('CUSTOMER_COUNTRY_ADDRESS') }} as customer_country_abbreviation,
        -- Other fields
        *
    from source
    -- Exclude rows with null email addresses
    where customer_email_address is not null
),

deduplicated as (
    select
        *,
        ROW_NUMBER() OVER (PARTITION BY customer_firstname, customer_lastname ORDER BY customer_id) as row_number
    from cleaned
),

filtered as (
    select
        *
    from deduplicated
    where row_number = 1
),

validated as (
    select
        *,
        -- Check if the email address is valid
        case
            when REGEXP_LIKE(customer_email_address, '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$') then 'valid'
            else 'invalid'
        end as email_validation
    from filtered
)

select * from validated



-- with source as (
--     select * from {{ ref('int_apple_shop_customer') }}
-- ),

-- cleaned as (
--     select
--         -- Format the birth year by removing commas
--         replace(customer_birthyear, ',', '')::integer as C_BIRTH_YEAR_CLEANED,
--         -- Other fields
--         *
--     from source
--     -- Exclude rows with null email addresses
--     where  customer_email_address is not null
-- ),

-- deduplicated as (
--     select
--         *,
--         ROW_NUMBER() OVER (PARTITION BY customer_firstname, customer_lastname ORDER BY  customer_id) as row_number
--     from cleaned
-- ),

-- filtered as (
--     select
--         *
--     from deduplicated
--     where row_number = 1
-- ),

-- validated as (
--     select
--         *,
--         -- Check if the email address is valid
--         case
--             when REGEXP_LIKE(customer_email_address, '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$') then 'valid'
--             else 'invalid'
--         end as email_validation
--     from filtered
-- )

-- select * from validated