

SELECT
    user_id,
    satisfaction_score,
    CASE
        WHEN satisfaction_score >= 4.5 THEN 'Excellent'
        WHEN satisfaction_score >= 3.0 THEN 'Good'
        WHEN satisfaction_score >= 1.5 THEN 'Fair'
        ELSE 'Poor'
    END AS satisfaction_category
FROM ab_test_users;
