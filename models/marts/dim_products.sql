with products as (
    select * from {{ ref('stg_production__products') }}
),

categories as (
    select * from {{ ref('stg_production__categories') }}
),

brands as (
    select * from {{ ref('stg_production__brands') }}
)

select
    p.product_id,
    p.product_name,
    p.model_year,
    p.list_price,
    c.category_name,
    b.brand_name
from products p
left join categories c using (category_id)
left join brands b using (brand_id)
