select
    orderid as order_id,
    sum(coalesce(amount, 0)) / 100 as amount
from raw.stripe.payment
where status = 'success'
group by order_id
