with orders as (
    select * from {{ ref('fct_orders') }}
),

products as (
    select * from {{ ref('dim_products') }}
),

customers as (
    select * from {{ ref('dim_customers') }}
),

stores as (
    select * from {{ ref('dim_stores') }}
),

staffs as (
    select * from {{ ref('dim_staffs') }}
),

final as (
    select
        -- order identifiers
        o.order_id,
        o.item_id,

        -- dates
        o.order_date,
        date_trunc(o.order_date, month)  as order_month,
        date_trunc(o.order_date, year)   as order_year,

        -- order status label
        o.order_status,
        case o.order_status
            when 1 then 'Pending'
            when 2 then 'Processing'
            when 3 then 'Rejected'
            when 4 then 'Completed'
        end                              as order_status_label,

        -- store
        st.store_name,
        st.city  as store_city,
        st.state as store_state,

        -- staff
        sf.full_name as staff_name,

        -- customer
        c.full_name  as customer_name,
        c.city       as customer_city,
        c.state      as customer_state,

        -- product
        p.product_name,
        p.category_name,
        p.brand_name,
        p.model_year,

        -- financials
        o.quantity,
        o.list_price,
        o.discount,
        o.revenue,

        -- operations
        o.days_to_ship
    from orders o
    left join products  p  using (product_id)
    left join customers c  using (customer_id)
    left join stores    st using (store_id)
    left join staffs    sf using (staff_id)
)

select * from final
