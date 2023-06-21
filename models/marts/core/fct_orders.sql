with orders as (
    
    select * from {{ ref('stg_Ibm_orders') }} 

),
order_item as (
    
    select * from {{ ref('int_order_items') }}

),
order_item_summary as (

    select 
        order_key,
        sum(gross_item_sales_amount) as gross_item_sales_amount,
        sum(item_discount_amount) as item_discount_amount,
        sum(item_tax_amount) as item_tax_amount,
        sum(net_item_sales_amount) as net_item_sales_amount
    from order_item
    group by
        1
),
final as (

    select 

        orders.order_key, 
        orders.order_date,
        orders.customer_key,
        orders.status_code,
        orders.priority_code,
        orders.clerk_name,
        orders.ship_priority,
                
        1 as order_count,                
        order_item_summary.gross_item_sales_amount,
        order_item_summary.item_discount_amount,
        order_item_summary.item_tax_amount,
        order_item_summary.net_item_sales_amount
    from
        orders
        inner join order_item_summary
            on orders.order_key = order_item_summary.order_key
)
select 
    *
from
    final

order by
    order_date


with orders as  (
    select * from {{ ref('stg_orders' )}}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount

    from payments
    group by 1
),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount

    from orders
    left join order_payments using (order_id)
)

select * from final