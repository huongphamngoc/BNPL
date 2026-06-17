WITH source AS (
    SELECT * FROM {{ source('BNPL', 'Loans') }}
)
SELECT 
    "loan_id" AS loan_id,
    "application_id" AS application_id,
    "customer_id" AS customer_id,
    "merchant_id" AS merchant_id,
    "principal_usd" AS principal_usd,
    "term_months" AS term_months,
    "apr" AS apr,
    "disbursed_at" AS disbursed_at,
    "status" AS status,
    "current_dpd" AS current_dpd
FROM source