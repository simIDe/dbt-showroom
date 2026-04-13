with customers as (
    select * from {{ ref('stg_sales__customers') }}
)

select
    customer_id,
    first_name,
    last_name,
    first_name || ' ' || last_name as full_name,
    email,
    phone,
    city,
    state,
    zip_code
from customers
