-- Orders should never have an order_date in the future.
-- Returns rows that violate this rule — test passes when 0 rows returned.
select *
from {{ ref('fct_orders') }}
where order_date > current_date
