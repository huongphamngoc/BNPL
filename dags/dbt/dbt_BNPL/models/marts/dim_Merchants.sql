with merchants AS (
    SELECT * FROM {{ ref('stg_bnpl_merchants') }}
)
SELECT 
    merchant_id,
    merchant_name,
    category,
    onboarded_date,
    risk_tier,
    CASE 
        WHEN onboarded_date >= '2025-10-01' THEN 1 
        ELSE 0 
    END AS is_new_merchant
FROM merchants
