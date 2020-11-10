WITH customer_payments AS (
    select
        order_id,
        sum(amount) as amount
    from {{ ref('stg_payments') }}
    where status = 'success'
    group by order_id
)
SELECT orders.order_id, orders.customer_id, customer_payments.amount
FROM {{ ref('stg_orders') }} AS orders 
INNER JOIN customer_payments
ON orders.order_id = customer_payments.order_id
