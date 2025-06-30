import pandas as pd
import numpy as np

# Load the data
df = pd.read_csv("data/ab_data.csv") 

# Add 'tasks_completed'
np.random.seed(42)
df['tasks_completed'] = np.where(
    df['group'] == 'control',
    np.random.poisson(lam=5, size=len(df)),  # control group avg = 5
    np.random.poisson(lam=7, size=len(df))   # treatment group avg = 7
)

# Add 'satisfaction_score' (scale: 1.0 to 5.0)
df['satisfaction_score'] = np.where(
    df['group'] == 'control',
    np.round(np.random.normal(loc=3.5, scale=0.7, size=len(df)), 1),
    np.round(np.random.normal(loc=4.0, scale=0.6, size=len(df)), 1)
)
df['satisfaction_score'] = df['satisfaction_score'].clip(1.0, 5.0)

# Add 'churned' (0 = stayed, 1 = unsubscribed)
df['churned'] = np.where(
    df['group'] == 'control',
    np.random.binomial(n=1, p=0.20, size=len(df)),  # 20% churn rate
    np.random.binomial(n=1, p=0.12, size=len(df))   # 12% churn rate
)

# Save the enhanced dataset
df.to_csv("data/enhanced_ab_data.csv", index=False)
print("Enhanced dataset saved as 'enhanced_ab_data.csv'")
