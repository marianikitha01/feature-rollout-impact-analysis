-- Cohort Analysis Based on Signup Date
WITH cohorts AS (
    SELECT
        user_id,
        MIN(DATE(timestamp)) AS signup_date
    FROM ab_test_users
    GROUP BY user_id
),
activity AS (
    SELECT
        u.user_id,
        DATE(u.timestamp) AS activity_date,
        c.signup_date,
        DATE_PART('day', u.timestamp::timestamp - c.signup_date::timestamp) AS days_since_signup
    FROM ab_test_users u
    JOIN cohorts c ON u.user_id = c.user_id
)
SELECT
    signup_date,
    days_since_signup,
    COUNT(DISTINCT user_id) AS active_users
FROM activity
GROUP BY signup_date, days_since_signup
ORDER BY signup_date, days_since_signup;