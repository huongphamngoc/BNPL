WITH source AS (
    SELECT * FROM {{ source('BNPL', 'Loan_applications') }}
)
SELECT
    "application_id" AS application_id,
    "customer_id" AS customer_id,
    "merchant_id" AS merchant_id,
    "applied_at" AS applied_at,
    "amount_requested_usd" AS amount_requested_usd,
    "decision" AS decision,
    "decision_reason" AS decision_reason,
    "decision_at" AS decision_at
FROM source