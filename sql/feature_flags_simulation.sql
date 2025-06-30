
-- Simulate Feature Flag Join
WITH feature_flags AS (
    SELECT DISTINCT
        user_id,
        'new_onboarding_ui' AS feature_name,
        TRUE AS feature_enabled
    FROM ab_test_users
    WHERE group_name = 'treatment'
)
SELECT
    u.*,
    f.feature_enabled
FROM ab_test_users u
LEFT JOIN feature_flags f ON u.user_id = f.user_id;
