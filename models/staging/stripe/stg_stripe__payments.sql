select
    id as payment_id,
    orderid as order_id,
    paymentmethod,
    status,
    -- amount is stored in cents, convert it to dollars
    {{ cents_to_dollar('amount') }} as amount,
    created as created_at

    from {{ source('stripe', 'payment') }}
