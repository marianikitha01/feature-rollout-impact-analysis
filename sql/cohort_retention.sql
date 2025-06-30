-- Retention Over Time by Cohort (Fixed)
WITH first_seen AS (
    SELECT user_id, MIN(DATE(timestamp)) AS cohort_date
    FROM ab_test_users
    GROUP BY user_id
),
retention_data AS (
    SELECT
        u.user_id,
        DATE(u.timestamp) AS activity_date,
        f.cohort_date,
        (DATE(u.timestamp) - f.cohort_date) AS day_number
    FROM ab_test_users u
    JOIN first_seen f ON u.user_id = f.user_id
)
SELECT
    cohort_date,
    day_number,
    COUNT(DISTINCT user_id) AS retained_users
FROM retention_data
GROUP BY cohort_date, day_number
ORDER BY cohort_date, day_number;
