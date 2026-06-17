WITH source AS (
    SELECT * FROM {{ source('BNPL', 'Repayments') }}
)
SELECT 
    "payment_id" AS payment_id,
    "loan_id" AS loan_id,
    "scheduled_date" AS scheduled_date,
    "scheduled_amount_usd" AS scheduled_amount_usd,
    "paid_ts" AS paid_ts,
    "paid_amount_usd" AS paid_amount_usd,
    "status" AS status
FROM source