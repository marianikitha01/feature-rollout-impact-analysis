import pandas as pd
from scipy.stats import ttest_ind, chi2_contingency

# Load your enhanced dataset
df = pd.read_csv("data/enhanced_ab_data.csv")

# Rename 'group' to 'group_name' for consistency
df.rename(columns={'group': 'group_name'}, inplace=True)

# Split into control and treatment
control = df[df['group_name'] == 'control']
treatment = df[df['group_name'] == 'treatment']

print("=== A/B TEST RESULTS ===")

# 🔹 1. Conversion Rate (Chi-square)
conv_table = pd.crosstab(df['group_name'], df['converted'])
chi2, p, _, _ = chi2_contingency(conv_table)
print(f"\nConversion Rate Test (Chi-square): p = {p:.4f}")

# 🔹 2. Churn Rate (Chi-square)
churn_table = pd.crosstab(df['group_name'], df['churned'])
chi2, p, _, _ = chi2_contingency(churn_table)
print(f"Churn Rate Test (Chi-square): p = {p:.4f}")

# 🔹 3. Tasks Completed (T-test)
t_stat, p = ttest_ind(treatment['tasks_completed'], control['tasks_completed'])
print(f"Tasks Completed (T-test): p = {p:.4f}")

# 🔹 4. Satisfaction Score (T-test)
t_stat, p = ttest_ind(treatment['satisfaction_score'], control['satisfaction_score'])
print(f"Satisfaction Score (T-test): p = {p:.4f}")
