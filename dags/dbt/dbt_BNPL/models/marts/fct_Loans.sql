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
    -- Phân tích Cohort: Lấy tháng, năm giải ngân
    EXTRACT(year FROM disbursed_at) as cohort_year,
    EXTRACT(month FROM disbursed_at) as cohort_month,
    to_char(disbursed_at, 'YYYY-MM') as cohort_year_month,
    status as loan_status,
    current_dpd,  
    -- Định nghĩa nợ xấu (C-level metric)
    case 
        when status in ('delinquent', 'written_off') or current_dpd > 30 then 1 
        else 0 
    end as is_bad_loan
FROM loans