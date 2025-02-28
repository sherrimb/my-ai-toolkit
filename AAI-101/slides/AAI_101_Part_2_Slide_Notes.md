**Consolidated Document**  
**Practical AI Curriculum – Module 1 (Part 2): Introduction to AI Tools for Developers**

---

## Table of Contents
1. [Overview](#overview)  
2. [Requirements & Setup](#requirements--setup)  
3. [Jupyter Notebook](#jupyter-notebook)  
    3.1. [Introduction](#31-introduction)  
    3.2. [Key Concepts](#32-key-concepts)  
4. [Pandas](#pandas)  
    4.1. [Introduction](#41-introduction)  
    4.2. [DataFrame](#42-dataframe)  
    4.3. [Series](#43-series)  
    4.4. [loc and iloc Methods](#44-loc-and-iloc-methods)  
    4.5. [Data Access and Merging](#45-data-access-and-merging)  
    4.6. [Time Series and Temporal Analysis](#46-time-series-and-temporal-analysis)  
    4.7. [Data Cleaning](#47-data-cleaning)  
5. [Visualizations](#visualizations)  
6. [NLP (Natural Language Processing)](#nlp-natural-language-processing)  
7. [pyplot](#pyplot)  
8. [Deliverables](#deliverables)  
9. [Assignment Details](#assignment-details)  
    9.1. [Upload Options](#91-upload-options)  
10. [References & Resources](#references--resources)  

---

<a name="overview"></a>
## 1. Overview
This document provides a structured overview of **Part 2** of Module 1 in the CodeBoxx **Practical AI** curriculum. Part 2 focuses on introducing AI tools for developers, particularly in the context of **Jupyter Notebook**, **Pandas**, and related data analysis and visualization libraries.

---

<a name="requirements--setup"></a>
## 2. Requirements & Setup

- **Install the Anaconda Package Manager**  
  Anaconda provides a convenient way to manage Python environments and comes bundled with many data science packages, including Jupyter Notebook.

- **Install Visual Studio Code (VS Code)**  
  VS Code is a popular integrated development environment (IDE) that can run and debug Python code. It also has a dedicated Jupyter extension for running Jupyter Notebooks directly in the editor.

---

<a name="jupyter-notebook"></a>
## 3. Jupyter Notebook

<a name="31-introduction"></a>
### 3.1. Introduction
**Jupyter Notebook** is an open-source web application that enables you to create and share documents containing:
- Live code
- Equations
- Visualizations
- Narrative text (Markdown/LaTeX)

It supports interactive computing and is widely used for:
- Data analysis
- Scientific research
- Machine learning

In a Jupyter Notebook:
1. You write and execute Python code in **code cells**.
2. You can visualize data outputs directly within the notebook.
3. You can document the analysis with **Markdown cells**, allowing for readable, reproducible workflows.

<a name="32-key-concepts"></a>
### 3.2. Key Concepts
- **Cells**: Two common cell types are:
  - *Code cells*: Contain Python code that can be executed in place.
  - *Markdown cells*: Contain descriptive text, written in Markdown format.
- **Inputs & Outputs**: You can see the output immediately after running the cell.
- **Order of Execution**: The state of the notebook is determined by the order in which cells are run, not just their order in the document.
- **Documentation**: You can embed headings, bullet points, or even LaTeX for mathematical equations in Markdown cells.

**Recommended Setup**  
- Download Jupyter Notebook with the Anaconda distribution.  
- Alternatively, use Jupyter Notebooks directly in VS Code with the [Jupyter extension](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter).

---

<a name="pandas"></a>
## 4. Pandas

<a name="41-introduction"></a>
### 4.1. Introduction
**Pandas** is a powerful, open-source Python library designed for data manipulation and analysis. It provides two primary data structures:
1. **DataFrame**
2. **Series**

With Pandas, you can:
- Easily perform tasks like reading/writing data in CSV, Excel, JSON, etc.
- Clean and transform data.
- Conduct complex data operations such as grouping, aggregations, merges, and more.

**Why is Pandas important?**  
Most machine learning models rely on data in a tabular format, typically organized in Pandas DataFrames. Familiarity with Pandas is essential for data wrangling, exploration, and preparation tasks.

<a name="42-dataframe"></a>
### 4.2. DataFrame
A **DataFrame** is a 2-dimensional labeled data structure, similar to a table or spreadsheet. It can contain columns of differing data types.

- **Data Representation**: Rows and columns, each with labels (indices for rows, names for columns).
- **Common Operations**: Filtering, sorting, grouping, merging, etc.
- **Examples**:  
  ```python
  import pandas as pd

  df = pd.read_csv("my_data.csv")  # Reading a CSV into a DataFrame
  print(df.head())                 # Display the first few rows
  ```

<a name="43-series"></a>
### 4.3. Series
A **Series** is a 1-dimensional labeled array, capable of holding any data type (integers, strings, floats, Python objects, etc.).

- **Relation to DataFrame**: A DataFrame is essentially a collection of multiple Series objects sharing the same index.
- **Example**:  
  ```python
  my_series = df["column_name"]  # Extract a single column as a Series
  ```

---

<a name="44-loc-and-iloc-methods"></a>
### 4.4. loc and iloc Methods
These methods are used for indexing and selecting data from a DataFrame.

- **`df.loc[...]`**: Accesses data by row *labels* or *column names*.  
  - Includes both the starting and ending points when slicing.
  - Example:  
    ```python
    df.loc[:500]  # If the index is integer-based and in ascending order, 
                  # this will include rows from 0 up to and including 500.
    ```

- **`df.iloc[...]`**: Accesses data by *integer* location.  
  - Excludes the ending point when slicing.
  - Examples:  
    ```python
    df.iloc[500]         # Returns the 501st row (0-based index)
    df.iloc[500, 3]      # 501st row, 4th column
    df.iloc[:500, [0,1,3]]   # Rows 0 to 499, columns 0, 1, and 3
    ```

**Key Difference**  
- `loc`: Uses the DataFrame’s labels for rows/columns.  
- `iloc`: Uses numerical indices (e.g., row 0, 1, 2, ...).

---

<a name="45-data-access-and-merging"></a>
### 4.5. Data Access and Merging

#### Reading Data
- **`pd.read_csv("file.csv")`**  
  The most common way to load CSV files into a DataFrame.  
  You may need to adjust parameters (e.g., `encoding`, `delimiter`, `header`) based on the file’s characteristics.
- **`pd.read_json("file.json")`**  
  Common for JSON-formatted data.

#### Merging Data
- **`df.merge()`**  
  Allows SQL-like joins (inner, outer, left, right).  
  Be mindful of duplicate column names.

#### Grouping Data
- **`df.groupby("some_column")`**  
  Useful for aggregations. For example, to calculate mean, sum, or counts by group.  
  ```python
  grouped_data = df.groupby("category_column")
  result = grouped_data["value_column"].mean()
  ```

---

<a name="46-time-series-and-temporal-analysis"></a>
### 4.6. Time Series and Temporal Analysis
Pandas provides extensive support for time series data and date/time operations:

- **Converting to Datetime**  
  ```python
  df["date_column"] = pd.to_datetime(df["date_column"])
  ```
- **Resampling & Shifting**  
  - `df.resample("D").sum()` (daily frequency)
  - `df.shift(1)` (shift values by 1 period)

Handling time series data properly ensures accurate analyses of trends, seasonality, and other temporal patterns.

---

<a name="47-data-cleaning"></a>
### 4.7. Data Cleaning
Data cleaning is crucial for reliable analysis and modeling:

- **Identifying & Handling Missing Values**:  
  - `df.isnull().sum()` to see missing values per column.  
  - `df.dropna()` or `df.fillna(value)` to remove or fill missing data.
- **Renaming Columns**:  
  ```python
  df.rename(columns={"old_name": "new_name"}, inplace=True)
  ```
- **Value Counts**:  
  ```python
  df["column_name"].value_counts()
  ```
- **Creating New Columns**:  
  ```python
  df["new_col"] = df["col1"] + df["col2"]
  ```
- **Filtering & Transformations**:  
  Filter rows or apply custom functions as needed to ensure data quality.

---

<a name="visualizations"></a>
## 5. Visualizations
Visualizing data is an integral part of exploratory data analysis:

- **Pandas Built-in Plots**  
  ```python
  df["column"].plot(kind="bar")
  df.plot(kind="line")
  df.hist()
  ```
- **Matplotlib Integration**  
  Pandas integrates smoothly with [Matplotlib](https://matplotlib.org/stable/tutorials/introductory/pyplot.html) for more extensive customization.

---

<a name="nlp-natural-language-processing"></a>
## 6. NLP (Natural Language Processing)
For text-based data, you can leverage various Python packages:

- **Spacy**  
  [Spacy](https://spacy.io/) is user-friendly and powerful for tasks like lemmatization, stemming, and named entity recognition.
- **NLTK**  
  [NLTK](https://github.com/hb20007/hands-on-nltk-tutorial) is a classic NLP library with extensive tutorials and resources.
- **String Methods on Pandas**  
  Pandas provides built-in string methods for cleaning and transforming text:
  ```python
  df["text_column"].str.lower()
  df["text_column"].str.contains("regex_pattern")
  ```
- **Regular Expressions (Regex)**  
  Use [Python’s `re` module](https://docs.python.org/3/library/re.html) for complex pattern matching and extraction.

---

<a name="pyplot"></a>
## 7. pyplot
**pyplot** is part of the **Matplotlib** library and provides a MATLAB-like interface for:

- Plotting line graphs, scatter plots, bar charts, etc.
- Customizing charts with labels, titles, legends, and more.
- Quick, convenient syntax for interactive data exploration.

Example:
```python
import matplotlib.pyplot as plt

plt.figure(figsize=(8,6))
plt.plot(df["x_column"], df["y_column"], 'o-')
plt.title("Sample Plot")
plt.xlabel("X-axis")
plt.ylabel("Y-axis")
plt.show()
```

---

<a name="deliverables"></a>
## 8. Deliverables
For **Part 2** of this module, your final submission should include:

1. **This Document**  
   A written summary (in Word, PDF, or similar) of your Part 2 activities.

2. **Your Jupyter Notebook**  
   - Show all operations tested/applied on your chosen dataset.  
   - Use *Markdown cells* to describe each operation, followed by *Code cells* to execute.  
   - Ensure the notebook runs **without errors**.

3. **Your Dataset**  
   - In `.csv` format (or any other original format if specified).

**Submission Format**  
Submit your deliverables as a **zip file** via the "Upload a File" option. The zip file should contain:  
- The consolidated document (this file).  
- Your Jupyter Notebook.  
- The dataset used.

---

<a name="assignment-details"></a>
## 9. Assignment Details
Provide a clear, concise description of your work in the assignment area. Include any relevant observations, challenges, or additional remarks about your data exploration.

<a name="91-upload-options"></a>
### 9.1. Upload Options
You have three upload options for submitting the assignment:
1. **Upload a File**  
   - Select one or more files from your device or drag and drop them.  
   - Maximum file size is 40MB.
2. **Record your Screen**  
   - Create a screen recording, then edit and share it on your platform. Link the URL in your submission (e.g., YouTube or Vimeo).
3. **Link a URL**  
   - If you are hosting the project or demonstrations elsewhere, provide one URL.

> **Note**: For this assignment, you must use the **“Upload a File”** option for the final deliverables (zip file).

---

<a name="references--resources"></a>
## 10. References & Resources

- **Jupyter Notebook**  
  - [Official Documentation](https://jupyter.org/)
- **Pandas**  
  - [10 Minutes to pandas](https://pandas.pydata.org/docs/user_guide/10min.html)  
  - [Pandas Documentation](https://pandas.pydata.org/docs/)
- **Data Access & Merging**  
  - [Pandas Merging, Joining, and Concatenation](https://pandas.pydata.org/pandas-docs/stable/user_guide/merging.html)
- **Matplotlib & pyplot**  
  - [Matplotlib Tutorial](https://matplotlib.org/stable/tutorials/introductory/pyplot.html)
- **NLP**  
  - [Spacy](https://spacy.io/)  
  - [NLTK Tutorials](https://github.com/hb20007/hands-on-nltk-tutorial)
- **Regex**  
  - [Python RegEx](https://docs.python.org/3/howto/regex.html)

---

**End of Document**