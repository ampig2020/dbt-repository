 select
    customer_id
 from {{ ref('fct_apple_shop_customer_final') }}
 group by customer_id
 having count(*) > 1