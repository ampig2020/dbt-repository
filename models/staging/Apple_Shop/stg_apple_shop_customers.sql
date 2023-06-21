with source_customer as (
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
        C_FIRST_SHIPTO_DATE_SK as customer_shipto_date,
        C_LAST_NAME as customer_lastname,
        C_LAST_REVIEW_DATE as customer_reviewdate,
        C_LOGIN as customer_login,
        C_PREFERRED_CUST_FLAG as customer_customerflag,
        C_SALUTATION as customer_salutation
    from {{ source('tpcds_sf10tcl', 'customer') }}
),
source_address as (
    select 
        CA_ADDRESS_SK as address_sk,
        CA_ADDRESS_ID as address_id,
        CA_CITY as city,
        CA_COUNTRY as country,
        CA_COUNTY as county,
        CA_GMT_OFFSET as gmt_offset,
        CA_LOCATION_TYPE as location_type,
        CA_STATE as state,
        CA_STREET_NAME as street_name,
        CA_STREET_NUMBER as street_number,
        CA_STREET_TYPE as street_type,
        CA_SUITE_NUMBER as suite_number,
        CA_ZIP as zip
    from {{ source('tpcds_sf10tcl', 'customer_address') }}
),
joined as (
    select 
        customer.*,
        address.city as customer_city,
        address.country as customer_country_address,
        address.county as customer_county,
        address.state as customer_state,
        address.street_name as customer_street_name,
        address.street_number as customer_street_number,
        address.street_type as customer_street_type,
        address.suite_number as customer_suite_number,
        address.zip as customer_zip,
        address.gmt_offset as customer_gmt_offset,
        address.location_type as customer_location_type
    from source_customer as customer
    left join source_address as address
    on customer.customer_current_address = address.address_sk
)

select * from joined
