import pandas as pd
import numpy as np

# === USER INPUTS ===
file_path = "ACFO_FitTests.xlsx"  # Change this to your file name
sheet_name = "SummaryUncertainty"  # The sheet we made earlier

# Read the sheet
df = pd.read_excel(file_path, sheet_name=sheet_name)

# Ignore the first column (sheet names)
data = df.iloc[:, 1:]

# Calculate total uncertainty for each column
n = len(data)
total_uncertainty = np.sqrt((data**2).sum()) / n

# Create the new row
new_row = pd.DataFrame([["total uncertainty"] + total_uncertainty.tolist()],
                       columns=df.columns)

# Append and save
df = pd.concat([df, new_row], ignore_index=True)
df.to_excel(file_path, sheet_name=sheet_name, index=False)

print("✅ Total uncertainty added to the bottom of the sheet.")
