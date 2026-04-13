with source as (
    select * from {{ source('production', 'stocks') }}
),

renamed as (
    select
        store_id,
        product_id,
        quantity
    from source
)

select * from renamed
