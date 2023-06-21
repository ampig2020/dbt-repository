with source as (
    select * from {{ ref('int_apple_shop_customer') }}
),

cleaned as (
    select
        -- Remove duplicates by selecting the first row of each group of rows with the same first and last name
        distinct on (C_FIRST_NAME, C_LAST_NAME) *,

        -- Format the birth year by removing commas
        replace(C_BIRTH_YEAR, ',', '')::integer as C_BIRTH_YEAR_CLEANED
    from source
    -- Exclude rows with null email addresses
    where C_EMAIL_ADDRESS is not null
),

validated as (
    select
        *,
        -- Check if the email address is valid
        case
            when C_EMAIL_ADDRESS ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$' then 'valid'
            else 'invalid'
        end as email_validation
    from cleaned
)

select * from validated
