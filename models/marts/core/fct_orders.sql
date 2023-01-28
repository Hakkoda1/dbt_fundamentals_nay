with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

order_amounts as (

    select 

        orders.order_id,
        orders.customer_id,
        payments.amount

    from orders
    left join payments
    on orders.order_id = payments.order_id

)

select * from order_amounts

