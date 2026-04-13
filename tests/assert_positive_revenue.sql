-- All revenue values must be positive.
-- Returns rows that violate this rule — test passes when 0 rows returned.
select *
from {{ ref('fct_orders') }}
where revenue < 0
