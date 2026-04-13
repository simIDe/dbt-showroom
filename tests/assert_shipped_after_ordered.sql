-- An order cannot be shipped before it was placed.
-- Returns rows that violate this rule — test passes when 0 rows returned.
select *
from {{ ref('fct_orders') }}
where shipped_date < order_date
