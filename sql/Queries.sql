CREATE TABLE ab_test_users (
    user_id BIGINT PRIMARY KEY,
    timestamp TEXT,
    group_name TEXT,
    landing_page TEXT,
    converted BOOLEAN,
    tasks_completed INTEGER,
    satisfaction_score FLOAT,
    churned BOOLEAN
);
SELECT * FROM ab_test_users;

-- Conversion rate by group
SELECT 
    group_name,
    COUNT(*) AS total_users,
    SUM(CASE WHEN converted THEN 1 ELSE 0 END) AS conversions,
    ROUND(AVG(CASE WHEN converted THEN 1 ELSE 0 END)::NUMERIC, 3) AS conversion_rate
FROM ab_test_users
GROUP BY group_name;

-- Average tasks completed 
SELECT 
    group_name,
    ROUND(AVG(tasks_completed)::NUMERIC, 2) AS avg_tasks_completed
FROM ab_test_users
GROUP BY group_name;

-- Satisfaction score comparison
SELECT 
    group_name,
    ROUND(AVG(satisfaction_score)::NUMERIC, 2) AS avg_satisfaction
FROM ab_test_users
GROUP BY group_name;

-- Churn rate
SELECT 
    group_name,
    COUNT(*) AS total_users,
    SUM(CASE WHEN churned THEN 1 ELSE 0 END) AS churned_users,
    ROUND(AVG(CASE WHEN churned THEN 1 ELSE 0 END)::NUMERIC, 3) AS churn_rate
FROM ab_test_users
GROUP BY group_name;

-- Basic user counts
SELECT 
    group_name,
    COUNT(*) AS num_users
FROM ab_test_users
GROUP BY group_name;


