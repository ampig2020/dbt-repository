


-- {%- set C_MKTSEGMENT = ['Machinery', 'Automobile', 'Furniture', 'Building', 'Household'] -%} --Setting Up Dictionary

-- with source_customer as (
--    select * from {{ source('tpch_sf100', 'customer') }}
-- ),

-- final as (
--    select
--        C_NATIONKEY,
--        {%- for segment in C_MKTSEGMENT -%}
--        max(case when C_MKTSEGMENT = '{{ segment }}' then C_COMMENT end)
--             as {{ segment }}_comment,
--        max(case when C_MKTSEGMENT = '{{ segment }}' then C_NAME end)
--             as {{ segment }}_customer
--        {%- if not loop.last -%}
--          ,
--        {%- endif -%}
--        {%- endfor %}
--    from source_customer
--    where C_ACCTBAL >= 0
--    group by C_NATIONKEY

-- )

-- select * from final;

-- {%- set C_MKTSEGMENT = ['Machinery', 'Automobile', 'Furniture', 'Building', 'Household'] -%}

-- with source_customer as (
--    select * from {{ source('tpch_sf100', 'customer') }}
-- ),

-- final as (
--    select
--        C_NATIONKEY,
--        {%- for segment in C_MKTSEGMENT -%}
--        max(case when C_MKTSEGMENT = '{{ segment }}' then C_COMMENT end)
--             as {{ segment }}_comment,
--        max(case when C_MKTSEGMENT = '{{ segment }}' then C_NAME end)
--             as {{ segment }}_customer
--        {%- if not loop.last -%}
--          ,
--        {%- endif -%}
--        {%- endfor %}
--    from source_customer
--    where C_ACCTBAL >= 0
--    group by C_NATIONKEY
-- )

-- select * from final;
