
-- Churn Segmentation
SELECT
    group_name,
    landing_page,
    churned,
    COUNT(*) AS user_count
FROM ab_test_users
GROUP BY group_name, landing_page, churned
ORDER BY group_name, churned DESC;
