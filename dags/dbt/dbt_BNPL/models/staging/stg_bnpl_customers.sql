WITH source AS (
    SELECT * FROM {{ source('BNPL', 'Customers') }}
)
SELECT  
    "customer_id" AS customer_id,
    "signup_ts" AS signup_ts,
	CASE
		WHEN "dob" > GETDATE() THEN NULL
		ELSE "dob"
	END AS dob,
    TRIM("email_hash") AS email_hash,
    INITCAP(TRIM("city")) AS city,
    "kyc_tier" AS kyc_tier,
    "income_band" AS income_band,
    "is_closed" AS is_closed
FROM source