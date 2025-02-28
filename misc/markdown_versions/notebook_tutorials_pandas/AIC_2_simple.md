# File path: ./notebook_tutorials_pandas/AIC_2_simple.ipynb

Welcome! This comprehensive tutorial will walk you step-by-step through an Extract, Transform, Load (ETL) workflow using four fabricated (dummy) datasets. While the project requirements are analogous to the elevator scenario you described, we’ll use a simpler, more relatable context: car registrations and inspections. This will allow you to practice the same concepts (collecting data, merging, cleaning, filtering, exploratory analysis, etc.) without getting lost in a real, more complex dataset.

Table of Contents
Introduction
Getting Started
Dummy Datasets Description
1. Registrations Dataset (registration.csv)
2. Ownership Dataset (ownership.json)
3. Modifications Dataset (modifications.json)
4. Testing (Inspection) Dataset (testing.csv)
Working Through the ETL Steps
Data Extraction: Loading the Data into Pandas
Data Exploration & Transformation
Part 1 – Analysis of Registrations (registration.csv)
1a) Identify Unique Identifier
1b) Majority Location & Extract Country/State
1c) Filter the DataFrame on Registration Status
1d) Verify Uniqueness of the Identifier
1e) Time Series of Expiration Counts by Month
1f) Create a Year-Month Table with Counts
Part 2 – Analysis of Ownership (ownership.json)
2a) Merge Filtered Registrations with Ownership
2b) Compare Location Fields
2c) Further Location Cleanup/Filtering
2d) Identify and Apply Filter on a Variable
2e) Clean or Reduce Categories of a Variable
Part 3 – Analysis of Modifications (modifications.json)
3a) Merge with the Already Merged Data
3b) Find Cars with More than 5 Modifications
3c) Count Combinations of Modification Type and Status
Part 4 – Analysis of Testing (testing.csv)
4a) Merge Strategy to Avoid Many-to-Many Issues
4b) Clean the Inspection Outcome Variable
4c) Calculate the Average Number of Inspections per Car
Conclusion
Introduction
In any data-driven project, ETL—Extract, Transform, Load—is an essential sequence:

Extract: Gathering data from various sources.
Transform: Cleaning, organizing, and reformatting the data to make it usable.
Load: Storing the cleaned data in a database or using it for analysis/modeling.
We’ll simulate each step with four dummy datasets in CSV/JSON formats. By the end, you’ll have practical experience reading, merging, cleaning, filtering, and visualizing data using Pandas, NumPy, Matplotlib, and basic Python.

Getting Started
Prerequisites:

Good grasp of core Python syntax (loops, functions, data structures).
No prior experience with data-focused libraries is strictly required—we’ll explain as we go.
Setup:

Install Anaconda (which includes Jupyter Notebook, Pandas, NumPy, Matplotlib, etc.).
Open Jupyter Notebook (or JupyterLab) and create a new notebook.
Dummy Datasets Description
Below are four fabricated datasets (each with 20 records). These are intentionally messy: some duplicates, inconsistent spacing, different date formats, etc., to mimic real-world scenarios. Feel free to copy them into local CSV/JSON files or define them in your notebook directly.

1. Registrations Dataset (registration.csv)
This dataset simulates a car registration table.

<details> <summary>Click to expand <code>registration.csv</code> sample data (20 rows)</summary>
mathematica
Copy
Edit
REGISTRATION_ID,LICENSE_PLATE,REGISTRATION_STATUS,REGISTRATION_EXPIRY_DATE,LOCATION,COUNTRY_STATE
1,ABC123,Active,2025-06-30,Springfield,USA-IL
2,XYZ789,Expired,2023-08-15,Shelbyville,USA-IN
3,JHG654, Active,06/15/2025,Capital City,USA-IL
4,RES321,Inactive,2025/07/01,Shelbyville,USA-IN
5,BHN908,Active,2024-12-31,Ogdenville,USA-OH
6,ABC123,Active,2025-06-30,Springfield,USA-IL
7,QWE111,Expired,15-01-2023,Shelbyville,USA-IN
8,ASD222,Active,2025-06-15,Springfield,USA-IL
9,ZXC333,Active,2023-06-30,North Haverbrook,USA-MI
10,UIO444, Active,2025-06-30,Shelbyville,USA-IN
11,JKL555,Inactive,2023/09/01,Capital City,USA-IL
12,   MNB666,Expired,2025-06-30,Springfield,USA-IL
13,VFR777,Active,2025/06/30,Ogdenville,USA-OH
14,PLM999, Active,2022-12-01,Capital City,USA-IL
15,OKM432,Inactive,2023-11-20,Shelbyville,USA-IN
16,KIU098,Active,2025-07-15,North Haverbrook,USA-MI
17,GHF765,Expired,2025-05-01,Ogdenville,USA-OH
18,REW111,Active,05-30-2025,Shelbyville,USA-IN
19,LKA112,Active,2023-06-30,Shelbyville,USA-IN
20,BHN908,Active,2024-12-31,Ogdenville,USA-OH
Notable Messiness:

LICENSE_PLATE repeated (e.g., ABC123 in rows 1 and 6, BHN908 in rows 5 and 20).
Inconsistent spacing in REGISTRATION_STATUS (e.g., Active vs. Active).
Different date formats: YYYY-MM-DD, YYYY/MM/DD, MM/DD/YYYY, etc.
Extra spaces before MNB666.
Duplicated or repeated ID? We see REGISTRATION_ID might be unique, but LICENSE_PLATE can repeat.
</details>
2. Ownership Dataset (ownership.json)
This dataset simulates car ownership details in JSON format.

<details> <summary>Click to expand <code>ownership.json</code> sample data (20 rows)</summary>
json
Copy
Edit
[
  {
    "owner_id": 100,
    "license_plate": "ABC123",
    "owner_name": "Homer Simpson",
    "owner_location": "Springfield",
    "region": "USA-IL",
    "purchase_date": "2021-05-20"
  },
  {
    "owner_id": 101,
    "license_plate": "XYZ789",
    "owner_name": "Marge Simpson",
    "owner_location": "Shelbyville",
    "region": "USA-IN",
    "purchase_date": "2022-08-01"
  },
  {
    "owner_id": 102,
    "license_plate": "JHG654",
    "owner_name": "Bart Simpson",
    "owner_location": " Capital City ",
    "region": "USA-IL",
    "purchase_date": "2023/01/10"
  },
  {
    "owner_id": 103,
    "license_plate": "RES321",
    "owner_name": "Moe Szyslak",
    "owner_location": "Shelbyville",
    "region": "USA-IN",
    "purchase_date": "2020-12-05"
  },
  {
    "owner_id": 104,
    "license_plate": "BHN908",
    "owner_name": "Principal Skinner",
    "owner_location": "Ogdenville",
    "region": "USA-OH",
    "purchase_date": "2019-11-30"
  },
  {
    "owner_id": 105,
    "license_plate": "QWE111",
    "owner_name": "Grampa Simpson",
    "owner_location": "Shelbyville",
    "region": "USA-IN",
    "purchase_date": "2022-06-15"
  },
  {
    "owner_id": 106,
    "license_plate": "ASD222",
    "owner_name": "Carl Carlson",
    "owner_location": "Springfield",
    "region": "USA-IL",
    "purchase_date": "2021-08-20"
  },
  {
    "owner_id": 107,
    "license_plate": "ZXC333",
    "owner_name": "Lenny Leonard",
    "owner_location": "North Haverbrook",
    "region": "USA-MI",
    "purchase_date": "2023-01-01"
  },
  {
    "owner_id": 108,
    "license_plate": "UIO444",
    "owner_name": "Edna Krabappel",
    "owner_location": " Shelbyville ",
    "region": "USA-IN",
    "purchase_date": "2020/10/05"
  },
  {
    "owner_id": 109,
    "license_plate": "JKL555",
    "owner_name": "Ned Flanders",
    "owner_location": "Capital city",
    "region": "USA-IL",
    "purchase_date": "2022-04-10"
  },
  {
    "owner_id": 110,
    "license_plate": "MNB666",
    "owner_name": "Maude Flanders",
    "owner_location": "Springfield",
    "region": "USA-IL",
    "purchase_date": "2023-07-12"
  },
  {
    "owner_id": 111,
    "license_plate": "VFR777",
    "owner_name": "Otto Mann",
    "owner_location": "Ogdenville",
    "region": "USA-OH",
    "purchase_date": "2021-01-10"
  },
  {
    "owner_id": 112,
    "license_plate": "PLM999",
    "owner_name": "Krusty the Clown",
    "owner_location": "Capital City",
    "region": "USA-IL",
    "purchase_date": "2022-12-01"
  },
  {
    "owner_id": 113,
    "license_plate": "OKM432",
    "owner_name": "Mr. Burns",
    "owner_location": "Shelbyville",
    "region": "USA-IN",
    "purchase_date": "2023-07-07"
  },
  {
    "owner_id": 114,
    "license_plate": "KIU098",
    "owner_name": "Smithers",
    "owner_location": "North Haverbrook",
    "region": "USA-MI",
    "purchase_date": "2023-02-14"
  },
  {
    "owner_id": 115,
    "license_plate": "GHF765",
    "owner_name": "Barney Gumble",
    "owner_location": "Ogdenville",
    "region": "USA-OH",
    "purchase_date": "2023-03-03"
  },
  {
    "owner_id": 116,
    "license_plate": "REW111",
    "owner_name": "Duffman",
    "owner_location": "Shelbyville",
    "region": "USA-IN",
    "purchase_date": "2021-05-20"
  },
  {
    "owner_id": 117,
    "license_plate": "LKA112",
    "owner_name": "Milhouse Van Houten",
    "owner_location": "Shelbyville",
    "region": "USA-IN",
    "purchase_date": "2023-06-01"
  },
  {
    "owner_id": 118,
    "license_plate": "BHN908",
    "owner_name": "Comic Book Guy",
    "owner_location": " Ogdenville ",
    "region": "USA-OH",
    "purchase_date": "2021-11-11"
  },
  {
    "owner_id": 119,
    "license_plate": "ABC123",
    "owner_name": "Clancy Wiggum",
    "owner_location": "Springfield",
    "region": "USA-IL",
    "purchase_date": "2022/01/01"
  }
]
Notable Messiness:

Extra spaces in owner_location.
Slightly different city name cases (Capital City vs. Capital City).
Date format differences.
Some cars appear multiple times (e.g., ABC123 at owner_id 100 and 119).
</details>
3. Modifications Dataset (modifications.json)
Represents car modifications (similar to "alterations").

<details> <summary>Click to expand <code>modifications.json</code> sample data (20 rows)</summary>
json
Copy
Edit
[
  {
    "mod_id": 1,
    "license_plate": "ABC123",
    "modification_type": "Engine Upgrade",
    "status_of_mod_request": "Approved"
  },
  {
    "mod_id": 2,
    "license_plate": "ABC123",
    "modification_type": "Paint Job",
    "status_of_mod_request": "Approved"
  },
  {
    "mod_id": 3,
    "license_plate": "JHG654",
    "modification_type": "Window Tint",
    "status_of_mod_request": "Pending"
  },
  {
    "mod_id": 4,
    "license_plate": "ZXC333",
    "modification_type": "Audio System",
    "status_of_mod_request": "Rejected"
  },
  {
    "mod_id": 5,
    "license_plate": "QWE111",
    "modification_type": "Engine Upgrade",
    "status_of_mod_request": "Approved"
  },
  {
    "mod_id": 6,
    "license_plate": "RES321",
    "modification_type": "Spoiler",
    "status_of_mod_request": "Approved"
  },
  {
    "mod_id": 7,
    "license_plate": "XYZ789",
    "modification_type": "Paint Job",
    "status_of_mod_request": "Approved"
  },
  {
    "mod_id": 8,
    "license_plate": "XYZ789",
    "modification_type": "Engine Upgrade",
    "status_of_mod_request": "Approved"
  },
  {
    "mod_id": 9,
    "license_plate": "BHN908",
    "modification_type": "Engine Upgrade",
    "status_of_mod_request": "Pending"
  },
  {
    "mod_id": 10,
    "license_plate": "BHN908",
    "modification_type": "Paint Job",
    "status_of_mod_request": "Pending"
  },
  {
    "mod_id": 11,
    "license_plate": "BHN908",
    "modification_type": "Window Tint",
    "status_of_mod_request": "Rejected"
  },
  {
    "mod_id": 12,
    "license_plate": "BHN908",
    "modification_type": "Engine Upgrade",
    "status_of_mod_request": "Approved"
  },
  {
    "mod_id": 13,
    "license_plate": "BHN908",
    "modification_type": "New Rims",
    "status_of_mod_request": "Approved"
  },
  {
    "mod_id": 14,
    "license_plate": "UIO444",
    "modification_type": "Audio System",
    "status_of_mod_request": "Pending"
  },
  {
    "mod_id": 15,
    "license_plate": "PLM999",
    "modification_type": "Paint Job",
    "status_of_mod_request": "Approved"
  },
  {
    "mod_id": 16,
    "license_plate": "GHF765",
    "modification_type": "Engine Upgrade",
    "status_of_mod_request": "Approved"
  },
  {
    "mod_id": 17,
    "license_plate": "GHF765",
    "modification_type": "Spoiler",
    "status_of_mod_request": "Pending"
  },
  {
    "mod_id": 18,
    "license_plate": "GHF765",
    "modification_type": "Window Tint",
    "status_of_mod_request": "Approved"
  },
  {
    "mod_id": 19,
    "license_plate": "MNB666",
    "modification_type": "New Rims",
    "status_of_mod_request": "Rejected"
  },
  {
    "mod_id": 20,
    "license_plate": "MNB666",
    "modification_type": "Spoiler",
    "status_of_mod_request": "Pending"
  }
]
Notable Points:

Some cars have multiple modifications (e.g., BHN908 has 5 modifications).
Different categories for modification_type and status_of_mod_request.
</details>
4. Testing (Inspection) Dataset (testing.csv)
Simulates a dataset of car testing/inspection results.

<details> <summary>Click to expand <code>testing.csv</code> sample data (20 rows)</summary>
mathematica
Copy
Edit
inspection_id,license_plate,inspection_date,inspection_outcome
1,ABC123,2021-06-01,Pass
2,ABC123,2022-06-02,Pass
3,XYZ789,2022-08-16,Fail
4,JHG654,2023-01-11,Pass
5,QWE111,2022-06-15,Fail
6,ZXC333,2023-02-01,Incomplete
7,ZXC333,2023-06-30,Pass
8,BHN908,2020-12-31,Fail
9,BHN908,2021-12-31,Fail
10,BHN908,2023-01-15,Pass
11,BHN908,2023-06-01,   pass
12,UIO444,2022-10-06,Fail
13,JKL555,2023-09-02,FAIL
14,MNB666,2025-07-01,Pass
15,VFR777,2024-01-10,Pass
16,PLM999,2023-12-01,Partial
17,KIU098,2025-07-15,Pass
18,GHF765,2025-05-15,fail
19,REW111,2023-05-30,Unknown
20,LKA112,2023-06-30,Pass
Notable Messiness:

Different ways of writing pass/fail (Pass, pass, FAIL, fail, etc.).
“Incomplete”, “Partial”, “Unknown” categories with few observations.
</details>
Working Through the ETL Steps
Below is a Jupyter Notebook style walk-through. Please copy the snippets into your notebook cells. Run them incrementally to follow along.

Data Extraction: Loading the Data into Pandas
python
Copy
Edit
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# To display plots inline in Jupyter
%matplotlib inline

# 1) Read the registration.csv file
registration_df = pd.read_csv('registration.csv')

# 2) Read the ownership.json file
ownership_df = pd.read_json('ownership.json')

# 3) Read the modifications.json file
modifications_df = pd.read_json('modifications.json')

# 4) Read the testing.csv file
testing_df = pd.read_csv('testing.csv')

# Let's do a quick look at each DataFrame
print("=== Registrations ===")
display(registration_df.head())

print("=== Ownership ===")
display(ownership_df.head())

print("=== Modifications ===")
display(modifications_df.head())

print("=== Testing ===")
display(testing_df.head())
At this point, we’ve extracted the data. Next, we’ll transform and analyze step-by-step.

Data Exploration & Transformation
Let’s mirror the requirements from the original outline—just adapted to our new car context.

Part 1 – Analysis of Registrations (registration.csv)
1a) Identify Unique Identifier
Goal: We need to figure out which column can uniquely identify a car.

In the elevator scenario, we used the “elevator unique ID.” Here, it seems we can use LICENSE_PLATE to consistently track a car across datasets. However, let’s confirm by scanning columns using code.

python
Copy
Edit
print("Columns:", registration_df.columns.tolist())

# We'll check the cardinality of each column
for col in registration_df.columns:
    print(f"{col} has {registration_df[col].nunique()} unique values.")
You might see:

REGISTRATION_ID: 20 unique values (but watch out for duplication possibility).
LICENSE_PLATE: fewer or more unique values (some duplicates).
In real-world terms, LICENSE_PLATE identifies the car. Even if we see duplicates in registration.csv, it’s presumably the same car re-registered or repeated rows. For the sake of merging across data, we choose LICENSE_PLATE as the anchor.

1b) Majority Location & Extract Country/State
Goal: We want to see which location is most frequent, and split the COUNTRY_STATE into two new columns: COUNTRY and STATE.

First, find the majority location:

python
Copy
Edit
registration_df['LOCATION'].value_counts()
This shows us which city is most common.

Then, extract COUNTRY and STATE from COUNTRY_STATE, which looks like USA-IL, USA-IN, etc. Pandas has a handy string method for splitting:

python
Copy
Edit
# Split the COUNTRY_STATE column
registration_df[['COUNTRY', 'STATE']] = registration_df['COUNTRY_STATE'].str.split('-', expand=True)

# Let's verify
registration_df.head()
1c) Filter the DataFrame on Registration Status
Goal: Decide how to filter REGISTRATION_STATUS. Possibly we only want Active statuses and remove expired/inactive.

Check unique statuses:

python
Copy
Edit
registration_df['REGISTRATION_STATUS'].unique()
You’ll see values like: ['Active', 'Expired', 'Inactive', ' Active', ...] with inconsistent spacing.

Step 1: Clean spacing:

python
Copy
Edit
registration_df['REGISTRATION_STATUS'] = registration_df['REGISTRATION_STATUS'].str.strip()
Step 2: Filter to keep only 'Active' or maybe 'Active' + 'Inactive' depending on your rationale. Suppose we keep only 'Active':

python
Copy
Edit
registration_df = registration_df[registration_df['REGISTRATION_STATUS'] == 'Active']

# Overwrite the DataFrame
registration_df.head()
1d) Verify Uniqueness of the Identifier
Goal: Double-check LICENSE_PLATE is unique.

We suspect it might not be strictly unique because the same plate can appear in multiple rows if the data is messy. Let’s check:

python
Copy
Edit
print("Number of rows:", len(registration_df))
print("Number of unique LICENSE_PLATE:", registration_df['LICENSE_PLATE'].nunique())

duplicates = registration_df[registration_df.duplicated('LICENSE_PLATE', keep=False)]
display(duplicates)
You’ll see duplicates for certain plates. This means LICENSE_PLATE is not a strict unique key in this table. It’s still the best cross-dataset identifier we have, but be mindful we can have multiple rows per plate here.

1e) Time Series of Expiration Counts by Month
Goal: Plot a time series for REGISTRATION_EXPIRY_DATE counts by month. Avoid hard-coding months.

We must parse the date column first because of multiple date formats. Let’s do a robust parse:

python
Copy
Edit
# Convert to datetime (coerce errors to NaT, which we might drop or fix later)
registration_df['REGISTRATION_EXPIRY_DATE'] = pd.to_datetime(
    registration_df['REGISTRATION_EXPIRY_DATE'], errors='coerce', infer_datetime_format=True
)

# Now let's extract year-month
registration_df['expiry_year_month'] = registration_df['REGISTRATION_EXPIRY_DATE'].dt.to_period('M')

# Count how many expirations per year-month
expiration_counts = registration_df['expiry_year_month'].value_counts().sort_index()

plt.figure(figsize=(10,5))
expiration_counts.plot(kind='line', marker='o')
plt.title("Number of Expirations by Year-Month")
plt.xlabel("Year-Month")
plt.ylabel("Count")
plt.xticks(rotation=45)
plt.show()
1f) Create a Year-Month Table with Counts
Goal: Similar to above but produce a table. Then add a more readable format like January 2025.

python
Copy
Edit
# Re-use our 'expiry_year_month' column
ym_counts = registration_df.groupby('expiry_year_month').size().reset_index(name='count')

# Filter only year-months with more than 5 occurrences
ym_counts = ym_counts[ym_counts['count'] > 5]

# Add a new column with format 'Month Year'
# Convert period to timestamp, then format
ym_counts['readable_month_year'] = ym_counts['expiry_year_month'].dt.strftime('%B %Y')

ym_counts
That yields a table of year-month combos (only those with > 5 occurrences).

Part 2 – Analysis of Ownership (ownership.json)
We have our filtered registrations from Part 1. Let’s merge them with the ownership data.

2a) Merge Filtered Registrations with Ownership
Goal: Join the two DataFrames on LICENSE_PLATE.

python
Copy
Edit
merged_reg_own = pd.merge(registration_df, ownership_df, 
                          on='license_plate', 
                          how='inner',  # or 'left', depending on your need
                          suffixes=('_reg','_own'))

print("Rows from registration_df (filtered):", len(registration_df))
print("Rows from ownership_df:", len(ownership_df))
print("Rows in merged dataset:", len(merged_reg_own))
You should see how many rows were matched.

2b) Compare Location Fields
Goal: We might have LOCATION from registrations vs. owner_location from ownership. Let’s see differences.

python
Copy
Edit
mismatch = merged_reg_own[merged_reg_own['LOCATION'] != merged_reg_own['owner_location'].str.strip()]
mismatch[['license_plate','LOCATION','owner_location']]
Note any discrepancies such as extra spaces, different city names, or capitalizations.

2c) Further Location Cleanup/Filtering
Goal: Decide how to handle these mismatches. Maybe we want to keep only rows where LOCATION and owner_location match after a bit of cleaning.

python
Copy
Edit
# Clean up owner_location
merged_reg_own['owner_location'] = merged_reg_own['owner_location'].str.strip().str.lower()
merged_reg_own['LOCATION'] = merged_reg_own['LOCATION'].str.strip().str.lower()

# Now filter
merged_reg_own = merged_reg_own[merged_reg_own['LOCATION'] == merged_reg_own['owner_location']]
Now we only keep data where the registration city matches the owner’s city (after lowercasing/spaces removed).

2d) Identify a Variable to Filter the Dataset
Goal: We might want only records in certain region(s) or a certain purchase date range.

For instance, we can filter out owners who purchased before 2021:

python
Copy
Edit
# Convert purchase_date to datetime
merged_reg_own['purchase_date'] = pd.to_datetime(merged_reg_own['purchase_date'], errors='coerce')
filtered_merged = merged_reg_own[merged_reg_own['purchase_date'] >= '2021-01-01']

# Overwrite
merged_reg_own = filtered_merged
2e) Clean or Reduce Categories of a Variable
Goal: Identify a column with more than 5 categories and unify or reduce them.

Possibilities:

region might have multiple states (USA-IL, USA-IN, USA-OH, USA-MI).
owner_location can have multiple city names.
If we pick region, we see these categories:

python
Copy
Edit
merged_reg_own['region'].value_counts()
Let’s say we have 4 states, but we want to group them into fewer (like grouping USA-IL and USA-IN together). An example:

python
Copy
Edit
def simplify_region(r):
    if r in ['USA-IL','USA-IN']:
        return 'Midwest_A'
    elif r in ['USA-OH','USA-MI']:
        return 'Midwest_B'
    else:
        return 'Other'

merged_reg_own['region_simplified'] = merged_reg_own['region'].apply(simplify_region)
Now we have fewer categories.

Part 3 – Analysis of Modifications (modifications.json)
3a) Merge with the Already Merged Data
Goal: Bring in modifications so we know which cars had modifications.

python
Copy
Edit
merged_reg_own_mod = pd.merge(merged_reg_own, modifications_df,
                              on='license_plate',
                              how='left')
Using a how='left' ensures we keep all records from the current merged data, even if they have no modifications (which will appear as NaN in mod columns).

3b) Find Cars with More than 5 Modifications
Goal: Some cars might have multiple modification entries. Let’s identify them.

python
Copy
Edit
# Group by license_plate, count modifications
mod_count = merged_reg_own_mod.groupby('license_plate')['mod_id'].count().reset_index(name='mod_count')

# Filter
cars_with_5plus = mod_count[mod_count['mod_count'] > 5]
cars_with_5plus
Then we can see which cars appear:

python
Copy
Edit
# Display rows related to those cars
merged_reg_own_mod[merged_reg_own_mod['license_plate'].isin(cars_with_5plus['license_plate'])]
3c) Count Combinations of Modification Type and Status
Goal: Count each unique combination, e.g., “Engine Upgrade”-“Approved”.

python
Copy
Edit
combos = merged_reg_own_mod.groupby(['modification_type','status_of_mod_request']).size().reset_index(name='count')
combos
We can see how many times each type + status pairing appears.

Part 4 – Analysis of Testing (testing.csv)
4a) Merge Strategy to Avoid Many-to-Many Issues
Goal: We now merge the (Registration-Ownership-Modifications) DataFrame with testing_df.

We must watch out for many duplicates. If one car has multiple modifications and multiple inspections, a naive merge could produce a “grid” of duplicates.
One strategy: Merge on a subset (e.g., license_plate) carefully, or reduce duplicates first. For example, if we only need the first or last modification, we can group or drop duplicates:

python
Copy
Edit
# For demonstration, let's keep the first modification entry per license_plate
reduced_mod = merged_reg_own_mod.drop_duplicates(subset=['license_plate'])

# Now merge with testing
final_merged = pd.merge(reduced_mod, testing_df, on='license_plate', how='left')

print("Rows in reduced_mod:", len(reduced_mod))
print("Rows in testing_df:", len(testing_df))
print("Rows in final_merged:", len(final_merged))
Explain your choice in real scenarios. Alternatively, you can keep the full data but be aware of the repeated rows.

4b) Clean the Inspection Outcome Variable
Goal: Unify categories: 'Pass', 'Fail', 'Incomplete', 'Partial', 'Unknown', etc. For categories with few occurrences, merge into 'Other'.

First, let’s strip and lower everything:

python
Copy
Edit
final_merged['inspection_outcome'] = final_merged['inspection_outcome'].str.strip().str.lower()
print(final_merged['inspection_outcome'].value_counts(dropna=False))
You might see:

pass, fail, incomplete, partial, unknown, plus weird spacing.
Combine smaller categories:

python
Copy
Edit
# Let's see total counts
outcome_counts = final_merged['inspection_outcome'].value_counts()
threshold = 2  # e.g., if the category has <=2 occurrences, we'll merge into "other"

def unify_outcome(x):
    if pd.isna(x):
        return x
    elif outcome_counts[x] <= threshold:
        return 'other'
    else:
        return x

final_merged['inspection_outcome_clean'] = final_merged['inspection_outcome'].apply(unify_outcome)
final_merged['inspection_outcome_clean'].value_counts(dropna=False)
We might also unify 'fail', 'FAIL', 'fail ' → 'fail'; ' pass' → 'pass'; etc.

4c) Calculate the Average Number of Inspections per Car
Goal: Each car can have multiple inspection rows. Let’s find the average.

python
Copy
Edit
inspections_count = testing_df.groupby('license_plate')['inspection_id'].count().reset_index(name='inspection_count')
avg_inspections = inspections_count['inspection_count'].mean()
print("Average number of inspections per car:", avg_inspections)
Conclusion
Congratulations! You’ve walked through a miniature ETL project:

Extract: Loaded CSV and JSON into Pandas.
Transform: Cleaned messy data (spaces, date formats), filtered rows, merged multiple datasets, reduced categories, and handled duplicates.
Load/Analyze: Did some basic analyses—time series plots, frequency counts, aggregator tables—to glean insights.
In your real elevator project, you’ll follow the same steps but with actual data. The main difference is scale and domain complexity. The logic—unique identifier selection, data cleaning, merges, filtering, grouping, and simple visualizations—all remain the same.

Key Takeaways:

Always explore data with .head(), .info(), .describe(), .unique(), and .value_counts().
Clean thoroughly: trim strings, unify date formats, handle duplicates.
Merging large datasets often requires careful strategies to avoid memory blowups.
Summaries and visuals (Matplotlib, Seaborn) help communicate your findings.
Feel free to experiment further with these dummy datasets. For instance:

Try different merges (inner, outer, left, right).
Attempt a more complex cleaning strategy for the city/region columns.
Use additional libraries like Seaborn for advanced plots.
Good luck, and enjoy your ETL journey!
