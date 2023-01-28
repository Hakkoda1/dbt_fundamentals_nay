with payments as (

    select

        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status as payment_status,
        amount,
        created as payment_date,
        _batched_at

    from {{ source('stripe', 'payment') }}

)

select * from payments