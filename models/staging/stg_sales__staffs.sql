with source as (
    select * from {{ source('sales', 'staffs') }}
),

renamed as (
    select
        staff_id,
        first_name,
        last_name,
        email,
        phone,
        cast(active as boolean) as is_active,
        store_id,
        manager_id
    from source
)

select * from renamed
