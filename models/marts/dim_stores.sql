with stores as (
    select * from {{ ref('stg_sales__stores') }}
)

select
    store_id,
    store_name,
    city,
    state,
    zip_code,
    phone,
    email
from stores
