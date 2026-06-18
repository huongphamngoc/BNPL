with customers AS (
    SELECT * FROM {{ ref('stg_bnpl_customers') }}
)
SELECT
    customer_id,
    signup_ts,
    EXTRACT(YEAR FROM dob) AS dob,
    city,
    kyc_tier,
    income_band,
    is_closed
FROM customers 