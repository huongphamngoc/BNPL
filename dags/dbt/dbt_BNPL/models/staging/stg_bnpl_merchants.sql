WITH source AS (
    SELECT * FROM {{ source('BNPL', 'Merchants') }}
)
SELECT 
    "merchant_id" AS merchant_id,
    INITCAP(TRIM("merchant_name")) AS merchant_name,
    INITCAP(TRIM("category")) AS category,
    "onboarded_date" AS onboarded_date,
    CASE WHEN "risk_tier" = 'A' THEN 'lowest'
         WHEN "risk_tier" = 'B' THEN 'medium'
         WHEN "risk_tier" = 'C' THEN 'highest'
    END AS risk_tier
FROM source