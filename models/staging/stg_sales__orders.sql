with source as (
    select * from {{ source('sales', 'orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        staff_id,
        store_id,
        order_status,
        cast(order_date as date)    as order_date,
        cast(required_date as date) as required_date,
        cast(shipped_date as date)  as shipped_date
    from source
)

select * from renamed
