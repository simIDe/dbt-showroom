with staffs as (
    select * from {{ ref('stg_sales__staffs') }}
),

stores as (
    select * from {{ ref('stg_sales__stores') }}
)

select
    s.staff_id,
    s.first_name,
    s.last_name,
    s.first_name || ' ' || s.last_name as full_name,
    s.email,
    s.is_active,
    s.manager_id,
    s.store_id,
    st.store_name
from staffs s
left join stores st using (store_id)
