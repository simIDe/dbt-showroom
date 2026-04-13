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
        cast(nullif(order_date, 'NULL') as date)    as order_date,
        cast(nullif(required_date, 'NULL') as date) as required_date,
        cast(nullif(shipped_date, 'NULL') as date)  as shipped_date
    from source
)

select * from renamed
