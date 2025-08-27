import pandas as pd
import numpy as np

# ==== User Inputs (edit here) ====
filename = 'ACFO_FitTests.xlsx'  # <-- your Excel file name
sheet_names = ['2715466M', '3619672M', '2218563F', '3614566F', '3012868M',
               '3821367F', '3316169M', '4028072M', '4824565F', '4920070M']  # <-- list of sheet names
num_cols = 6  # number of columns per section (ignoring first column of sheet)

# ==== Processing ====
all_labels = []
uncertainty_results = []

for idx, sheet in enumerate(sheet_names):
    # Read full sheet into DataFrame
    df = pd.read_excel(filename, sheet_name=sheet, header=None)

    # Ignore first column (Excel col A)
    df = df.iloc[:, 1:]

    # Section A: rows 0-3 (row 1 is labels, rows 2-4 are data)
    labels_a = df.iloc[0, :num_cols].tolist()
    data_a = df.iloc[1:4, :num_cols].to_numpy(dtype=float)

    # Section B: skip 2 blank rows, so start at row 5 (zero-indexed)
    labels_b = df.iloc[5, :num_cols].tolist()
    data_b = df.iloc[6:9, :num_cols].to_numpy(dtype=float)

    # On first iteration, set labels with prefixes
    if idx == 0:
        all_labels = ['a' + str(lab) for lab in labels_a] + ['b' + str(lab) for lab in labels_b]

    # Calculate uncertainty = std / sqrt(3)
    unc_a = np.std(data_a, axis=0, ddof=0) / np.sqrt(3)
    unc_b = np.std(data_b, axis=0, ddof=0) / np.sqrt(3)

    uncertainty_results.append(np.concatenate([unc_a, unc_b]))

# Convert to DataFrame for output
output_df = pd.DataFrame(
    uncertainty_results,
    index=sheet_names,
    columns=all_labels
)

# Reset index to have "Sheet Name" as first column
output_df = output_df.reset_index().rename(columns={'index': 'Sheet Name'})

# Write to new sheet in same Excel file
with pd.ExcelWriter(filename, engine='openpyxl', mode='a', if_sheet_exists='replace') as writer:
    output_df.to_excel(writer, sheet_name='SummaryUncertainty', index=False)

print(f'Uncertainty summary written to sheet "SummaryUncertainty" in {filename}')
