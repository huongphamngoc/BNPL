WITH loans AS (
    SELECT * FROM {{ ref('stg_bnpl_repayments') }}
)
SELECT
    payment_id,
    loan_id,
    scheduled_date,
    scheduled_amount_usd,
    paid_ts,
    paid_amount_usd,
    status AS payment_status,
    
    -- Cờ theo dõi thanh toán trễ/bùng
    CASE 
        WHEN status in ('late', 'missed') THEN 1 
        ELSE 0 
    END AS is_late_or_missed

FROM loans