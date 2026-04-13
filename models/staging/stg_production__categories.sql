with source as (
    select * from {{ source('production', 'categories') }}
),

renamed as (
    select
        category_id,
        category_name
    from source
)

select * from renamed
