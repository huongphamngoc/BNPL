WITH loans AS (
    SELECT * FROM {{ ref('stg_bnpl_loan_applications') }}
)
SELECT
    application_id,
    customer_id,
    merchant_id,
    EXTRACT(month FROM applied_at) as applied_month,
    EXTRACT(year FROM applied_at) as applied_year,
    to_char(applied_at, 'YYYY-MM') as applied_year_month,
    amount_requested_usd,
    decision,
    decision_reason,
    decision_at   
FROM loans