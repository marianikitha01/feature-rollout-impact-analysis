import pandas as pd
from sqlalchemy import create_engine

# Load the enhanced dataset
df = pd.read_csv("data/enhanced_ab_data.csv")

# Rename 'group' column to match your SQL table
df.rename(columns={'group': 'group_name'}, inplace=True)

# Convert binary 0/1 columns to boolean True/False
df['converted'] = df['converted'].astype(bool)
df['churned'] = df['churned'].astype(bool)

# PostgreSQL connection string (update your password here)
engine = create_engine('postgresql://postgres:<password>@localhost:5432/ab_test_project')

# Load into SQL, replacing table to avoid duplicates
df.to_sql('ab_test_users', engine, if_exists='replace', index=False)

print("Data loaded successfully into PostgreSQL")
