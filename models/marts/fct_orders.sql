with order_items as (
    select * from {{ ref('stg_sales__order_items') }}
),

orders as (
    select * from {{ ref('stg_sales__orders') }}
),

final as (
    select
        -- keys
        oi.order_id,
        oi.item_id,
        oi.product_id,
        o.customer_id,
        o.store_id,
        o.staff_id,

        -- dates
        o.order_date,
        o.required_date,
        o.shipped_date,

        -- order status (1=Pending, 2=Processing, 3=Rejected, 4=Completed)
        o.order_status,

        -- line item financials
        oi.quantity,
        oi.list_price,
        oi.discount,
        round(oi.quantity * oi.list_price * (1 - oi.discount), 2) as revenue,

        -- shipping delay in days (null when not yet shipped)
        date_diff(o.shipped_date, o.order_date, day) as days_to_ship
    from order_items oi
    left join orders o using (order_id)
)

select * from final
