with source as (
    select * from {{ source('sales', 'stores') }}
),

renamed as (
    select
        store_id,
        store_name,
        phone,
        email,
        street,
        city,
        state,
        zip_code
    from source
)

select * from renamed
