-- Discount must be between 0 (no discount) and 1 (100% off).
-- Returns rows that violate this rule — test passes when 0 rows returned.
select *
from {{ ref('fct_orders') }}
where discount < 0 or discount > 1
