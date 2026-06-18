WITH loans AS (
    SELECT * FROM {{ ref('stg_bnpl_loans') }}
)
SELECT
    loan_id,
    customer_id,
    merchant_id,
    application_id,
    principal_usd,
    term_months,
    apr,
    disbursed_at,
    -- Phân tích Cohort: Lấy tháng, năm giải ngân
    cohort_year,
    cohort_month,
    status,
    current_dpd
FROM loans