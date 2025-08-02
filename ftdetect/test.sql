-- models/analytical/dim_customer_cltv.sql
WITH customer_total_spend AS (
    SELECT
        c.customer_id,
        SUM(p.payment_amount) AS total_spent
    FROM {{ ref('stg_customers') }} c
    JOIN {{ ref('stg_payments') }} p ON c.customer_id = p.customer_id
    GROUP BY 1
),
customer_order_frequency AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders,
        DATEDIFF('day', MIN(order_date), MAX(order_date)) AS days_active
    FROM {{ ref('int_customer_orders') }}
    GROUP BY 1
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    cts.total_spent,
    cof.total_orders,
    cof.days_active,
    (cts.total_spent / NULLIF(cof.days_active, 0)) * 365 AS estimated_annual_cltv -- Simple CLTV calculation
FROM {{ ref('stg_customers') }} c
LEFT JOIN customer_total_spend cts ON c.customer_id = cts.customer_id
LEFT JOIN customer_order_frequency cof ON c.customer_id = cof.customer_id
