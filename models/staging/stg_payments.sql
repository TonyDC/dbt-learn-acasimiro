select
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,
    coalesce(amount, 0) / 100 AS amount,
    created
from {{ source('stripe', 'payment') }}
