# File path: ./notebook_tutorials_pandas/worksheet.ipynb


Welcome to your **hands-on** Pandas workout! This worksheet will challenge you to practice **core Pandas skills**, all derived from the tutorials you’ve just studied. 

**Happy Data Wrangling!** 🎉

**Enjoy your worksheet!** Feel free to adapt any steps based on your actual dataset’s needs (e.g., skip time series if no date column exists). Above all, **have fun** exploring and remember: **the best way to learn Pandas is by doing**!

## 💡 Step 0: Choose & Download a Dataset
Head over to the **[Google Dataset Search Engine](https://datasetsearch.research.google.com/)** and pick a dataset that intrigues you! Aim for a **CSV or Excel** file with **at least a few columns**—and ideally one or two interesting features to explore.

> **Suggested Datasets (Just Ideas!)**  
> - **World Happiness Report**  
> - **Global Earthquakes** (USGS)  
> - **IMDb Movies / TV Shows**  
> - **Weather Data** (NOAA)  
> - **Spotify / Music Streaming** Statistics  
>
> Feel free to pick **any** dataset that piques your curiosity—just make sure it’s not **Titanic** or **Air Quality** so you can practice on something fresh!

## 📥 Step 1: Import Pandas & Load Your Data
1. Import **pandas** (as `pd`) and optionally **matplotlib** for plotting.
2. Load your dataset using either `pd.read_csv(...)` or `pd.read_excel(...)`.
3. Preview the **first few rows** with `.head()`, and **last few rows** with `.tail()`.

<details>
<summary>Example Code Snippet</summary>

```python
import pandas as pd
import matplotlib.pyplot as plt  # optional, only if you plan to do plots

# Replace the file name/path below with your actual data
df = pd.read_csv("your_dataset.csv")

df.head()

```


## 🔍 Step 3: Selecting Data (Subsets of Rows & Columns)

1.  **Select a single column** (e.g., `df["ColumnName"]`).
2.  **Select multiple columns** at once (e.g., `df[["ColA", "ColB"]]`).
3.  Use **boolean indexing** to filter rows (e.g., `df[df["ColA"] > 100]`).
4.  Try combining conditions with `&` (AND) or `|` (OR).

-   Use **`.loc[]`** or **`.iloc[]`** to grab a specific subset, e.g., rows 10–20 and columns 2–4.
-   Find all rows that match a certain condition (e.g., a specific category or numeric threshold).

## 🎨 Step 4: Basic Plotting

> If your dataset doesn’t have numeric data, feel free to **skip** or adapt this step!

1.  Create a **line plot** using `df["SomeNumericColumn"].plot()`.
2.  Create a **histogram** of a numeric column using `df["NumericCol"].plot.hist(bins=20)`.
3.  (Optional) Try a **scatter plot** with `df.plot.scatter(x="ColA", y="ColB")`.

-   Remember, `.plot` on a **DataFrame** will often create a line plot of **all numeric columns** by default.
-   For more specialized plots, you can do `df.plot.<plot_type>()`, e.g. `.bar()`, `.box()`, `.density()`, etc.

## ➕ Step 5: Creating & Renaming Columns

1.  **Create a new column** that is derived from existing columns (e.g., a ratio, difference, or sum).
2.  If your dataset has no numeric columns to combine, try a **string** operation (e.g., combining first and last name).
3.  **Rename columns** with `df.rename(columns={"OldName": "NewName"})`.

```python
# Creating a new column based on a formula
df["NewColumn"] = df["ExistingNumColumn"] * 3.14

# Renaming columns
df = df.rename(columns={"OldColumn": "BetterName"})

## 📊 Step 6: Summary Statistics & Grouping

1.  Calculate basic **aggregations** like `.mean()`, `.median()`, or `.count()` on your numeric columns.
2.  Try **grouping** by a categorical column with `.groupby("SomeCategory").mean()`.
3.  Use `.value_counts()` on a categorical column to see the frequency of each category.

-   Which category has the highest **mean** or **count**?
-   Are there any surprising or interesting **groups** in your data?

## ♻️ Step 7: Reshaping (Pivot, Melt) (If Applicable)

If your dataset is “**wide**” or “**long**” and you want to **reshape** it:

1.  Use `df.pivot()` or `df.pivot_table(...)` to transform your data from long to wide format.
2.  Use `df.melt(...)` to go from wide to long format.
3.  If it doesn’t make sense for your current dataset, just read about it for future reference!

-   `pivot_table` can **aggregate** data if you have duplicates or if you want a group-wise summary.
-   `melt` is great for turning multiple columns into a single “value” column with a new “variable” column.


## 🔗 Step 8: Combining Data (Concat & Merge) (Optional)

If you find a **second** dataset on Google that relates to your first one:

1.  Use `pd.concat([df1, df2])` to stack them vertically if they have the **same columns**.
2.  Use `pd.merge(df1, df2, on="common_column")` to join them on a **shared key**.

-   Could you combine your main dataset with a small **lookup table** or metadata?
-   Check out the differences between `"inner"`, `"left"`, `"right"`, or `"outer"` merges.

## ⏰ Step 9: Time Series Fun (If Applicable)

If your dataset contains **dates**:

1.  Convert the date column to **datetime** using `pd.to_datetime()`.
2.  Set the date column as your index with `df.set_index("DateColumn", inplace=True)`.
3.  Try **resampling** or **grouping by** a time component:
    
    ```python
    df.resample("M").mean()  # monthly frequency
    df.resample("W").sum()   # weekly sum
    
    ```
    
4.  Slice by date range (e.g. `df["2021-01":"2021-03"]`).

## 🔤 Step 10: Text Manipulations

If you have **string columns**, try a few **`.str`** operations:

1.  Convert all text to **lowercase**: `df["TextCol"].str.lower()`.
2.  Check if the column **contains** a specific word: `df["TextCol"].str.contains("keyword")`.
3.  **Split** text on a delimiter: `df["TextCol"].str.split(",")`.
4.  **Replace** certain values or strings using `df.replace({"old": "new"})` or `df["TextCol"].str.replace(...)`.

## 💾 Step 11: Exporting Your Cleaned Data

1.  Save your **DataFrame** to a CSV file:
    
    ```python
    df.to_csv("my_cleaned_data.csv", index=False)
    
    ```
    
2.  Or save to an Excel spreadsheet:
    
    ```python
    df.to_excel("my_cleaned_data.xlsx", sheet_name="Sheet1", index=False)
    

## 🎉 Step 12: Wrap-Up & Reflection

-   **What was the most challenging** aspect of working with your dataset?
-   **Which method** or step do you feel you need more practice with?
-   **Any surprising findings** from your data analysis?

> **Congratulations** on completing this worksheet! By practicing each step, you’ve covered the **core Pandas functionalities**:

1.  **Reading & Writing** data
2.  **Selecting & Filtering** data
3.  **Plotting**
4.  **Creating & Renaming** columns
5.  **Summary Stats & Grouping**
6.  **Reshaping** data (pivot, melt)
7.  **Combining** datasets (concat, merge)
8.  **Handling Datetimes**
9.  **Text manipulations**

Now you have a solid foundation to explore **even more** of Pandas and apply your new skills to real-world data challenges!

## 🙌 Next Steps

-   Consider creating visualizations or dashboards using libraries like **Seaborn**, **Plotly**, or **Matplotlib**.
-   Practice making your analyses **repeatable** and **shareable** in a **Jupyter Notebook** or **GitHub repo**.
-   Keep experimenting with new datasets—**the more variety, the better** your skills become.

