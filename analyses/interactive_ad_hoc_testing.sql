 select
    customer_id
 from {{ ref('customers') }}
 group by customer_id
 having count(*) > 1