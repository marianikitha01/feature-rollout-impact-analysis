
-- Rolling 7-Day Average Tasks per User
SELECT
    user_id,
    DATE(timestamp) AS day,
    AVG(tasks_completed) OVER (
        PARTITION BY user_id
        ORDER BY DATE(timestamp)
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_7day_avg_tasks
FROM ab_test_users;
