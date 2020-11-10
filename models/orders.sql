SELECT orders.order_id, orders.customer_id, payments.amount
FROM {{ ref('stg_orders') }} AS orders 
INNER JOIN {{ ref('stg_payments') }} AS payments 
ON orders.order_id = payments.order_id
