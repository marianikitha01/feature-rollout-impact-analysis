
-- Churn Rate by Satisfaction Score Segments
SELECT
    CASE
        WHEN satisfaction_score < 2 THEN 'Low'
        WHEN satisfaction_score >= 2 AND satisfaction_score < 4 THEN 'Medium'
        ELSE 'High'
    END AS satisfaction_segment,
    COUNT(*) FILTER (WHERE churned = TRUE) * 1.0 / COUNT(*) AS churn_rate
FROM ab_test_users
GROUP BY satisfaction_segment;
