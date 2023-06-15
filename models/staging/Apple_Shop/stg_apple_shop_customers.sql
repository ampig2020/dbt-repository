with source as (

    select * from {{ source('apple_shop', 'customer') }}

),

renamed as (

    select

        C_CUSTOMER_ID as customer_id,
        C_BIRTH_COUNTRY as customer_country,
        C_BIRTH_DAY as customer_birthday,
        C_BIRTH_MONTH as customer_birthmonth,
        C_BIRTH_YEAR as customer_birthyear,
        C_CURRENT_ADDR_SK as customer_current_address,
        C_CURRENT_CDEMO_SK as customer_cdemo,
        C_CURRENT_HDEMO_SK as customer_hdemo,
        C_EMAIL_ADDRESS as customer_email_address,
        C_FIRST_NAME as customer_firstname,
        C_FIRST_SALES_DATE_SK as customer_sales_date,
        C_FIRST_SHIPTO_DATE_SK as order_key,
        C_LAST_NAME as customer_lastname,
        C_LAST_REVIEW_DATE as customer_reviewdate,
        C_LOGIN as customer_login,
        C_PREFERRED_CUST_FLAG as customer_customerflag,
        C_SALUTATION as customer_salutation

    from source

)

select * from renamed