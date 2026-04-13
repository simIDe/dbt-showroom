with source as (
    select * from {{ source('production', 'brands') }}
),

renamed as (
    select
        brand_id,
        brand_name
    from source
)

select * from renamed
