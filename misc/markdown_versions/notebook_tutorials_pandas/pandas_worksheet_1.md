# File path: ./notebook_tutorials_pandas/pandas_worksheet_1.ipynb


Welcome to this **hands-on** Pandas challenge! This worksheet will test and deepen your skills in **data manipulation, exploration, cleaning, and analysis**. By the end, you'll be ready to tackle **real-world** datasets with confidence.

---

## 🔍 **Step 1: Choose and Load Your Dataset**
Pick one of the following famous datasets to work with:
1. **Iris Dataset** 🌸 (Flower measurements)
2. **Wine Dataset** 🍷 (Chemical composition of wines)
3. **Boston Housing Dataset** 🏠 (Housing prices and features)

Each of these datasets is available in `sklearn.datasets`. Load it into a **Pandas `DataFrame`**.

```python
from sklearn.datasets import load_iris, load_wine, load_boston  # Boston may be deprecated in newer sklearn
import pandas as pd

# Uncomment the dataset you want to use
# data = load_iris()
# data = load_wine()
# data = load_boston()  # May require `fetch_openml("boston")` if not available directly

df = pd.DataFrame(data.data, columns=data.feature_names)

# If there's a target, store it separately or add it as a new column
# df['target'] = data.target

# Display first 5 rows
df.head()
```

> **Tip:** If you’re loading the **Boston** dataset via `fetch_openml`, you may need:
> ```python
> from sklearn.datasets import fetch_openml
> data = fetch_openml(name='boston', version=1)
> df = pd.DataFrame(data.data, columns=data.feature_names)
> df['target'] = data.target
> ```



```python
from sklearn.datasets import load_iris, load_wine
import pandas as pd
```


```python
raw_data = load_iris()
df = pd.DataFrame(raw_data.data, columns=raw_data.feature_names)
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>sepal length (cm)</th>
      <th>sepal width (cm)</th>
      <th>petal length (cm)</th>
      <th>petal width (cm)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5.1</td>
      <td>3.5</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4.9</td>
      <td>3.0</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>4.7</td>
      <td>3.2</td>
      <td>1.3</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4.6</td>
      <td>3.1</td>
      <td>1.5</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5.0</td>
      <td>3.6</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
  </tbody>
</table>
</div>



## 🧐 **Step 2: Initial Exploration**
1. Print the **shape** of the dataset (`.shape`).
2. Display the **column names** (`.columns`).
3. Check the **data types** of each column (`.dtypes`).
4. Get a **quick overview** of any **missing values** (e.g., `df.isnull().sum()`).
5. Generate **summary statistics** of numeric columns (`.describe()`).

```python
# Your code here!
```

> **Question:** Are there any columns that are not numeric? If so, how might that affect your analysis?




```python
df.shape
```




    (150, 4)




```python
df.columns
```




    Index(['sepal length (cm)', 'sepal width (cm)', 'petal length (cm)',
           'petal width (cm)'],
          dtype='object')




```python
df.dtypes
```




    sepal length (cm)    float64
    sepal width (cm)     float64
    petal length (cm)    float64
    petal width (cm)     float64
    dtype: object




```python
df.isnull().sum()
```




    sepal length (cm)    0
    sepal width (cm)     0
    petal length (cm)    0
    petal width (cm)     0
    dtype: int64




```python
df.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>sepal length (cm)</th>
      <th>sepal width (cm)</th>
      <th>petal length (cm)</th>
      <th>petal width (cm)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>150.000000</td>
      <td>150.000000</td>
      <td>150.000000</td>
      <td>150.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>5.843333</td>
      <td>3.057333</td>
      <td>3.758000</td>
      <td>1.199333</td>
    </tr>
    <tr>
      <th>std</th>
      <td>0.828066</td>
      <td>0.435866</td>
      <td>1.765298</td>
      <td>0.762238</td>
    </tr>
    <tr>
      <th>min</th>
      <td>4.300000</td>
      <td>2.000000</td>
      <td>1.000000</td>
      <td>0.100000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>5.100000</td>
      <td>2.800000</td>
      <td>1.600000</td>
      <td>0.300000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>5.800000</td>
      <td>3.000000</td>
      <td>4.350000</td>
      <td>1.300000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>6.400000</td>
      <td>3.300000</td>
      <td>5.100000</td>
      <td>1.800000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>7.900000</td>
      <td>4.400000</td>
      <td>6.900000</td>
      <td>2.500000</td>
    </tr>
  </tbody>
</table>
</div>



## 👀 **Step 3: Data Selection & Indexing**
1. Select only the **first 10 rows**.
2. Select only the columns that contain **numeric values**.
3. Extract all rows where the **first feature column** has a value **greater than its median**.
4. Find the row with the **maximum value** in the **last numeric column**.
5. Use **boolean indexing** or the **`.query()`** method to filter rows in a more readable way.

```python
# Your code here!
```

> **Challenge:** Practice both **label-based indexing** (`.loc`) and **integer-based indexing** (`.iloc`) to see the difference.

---


```python
df.head(10)
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>sepal length (cm)</th>
      <th>sepal width (cm)</th>
      <th>petal length (cm)</th>
      <th>petal width (cm)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5.1</td>
      <td>3.5</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4.9</td>
      <td>3.0</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>4.7</td>
      <td>3.2</td>
      <td>1.3</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4.6</td>
      <td>3.1</td>
      <td>1.5</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5.0</td>
      <td>3.6</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>5</th>
      <td>5.4</td>
      <td>3.9</td>
      <td>1.7</td>
      <td>0.4</td>
    </tr>
    <tr>
      <th>6</th>
      <td>4.6</td>
      <td>3.4</td>
      <td>1.4</td>
      <td>0.3</td>
    </tr>
    <tr>
      <th>7</th>
      <td>5.0</td>
      <td>3.4</td>
      <td>1.5</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>8</th>
      <td>4.4</td>
      <td>2.9</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>9</th>
      <td>4.9</td>
      <td>3.1</td>
      <td>1.5</td>
      <td>0.1</td>
    </tr>
  </tbody>
</table>
</div>




```python
# or, use iloc for explicit indexing:
df.iloc[:10]
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>sepal length (cm)</th>
      <th>sepal width (cm)</th>
      <th>petal length (cm)</th>
      <th>petal width (cm)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5.1</td>
      <td>3.5</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4.9</td>
      <td>3.0</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>4.7</td>
      <td>3.2</td>
      <td>1.3</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4.6</td>
      <td>3.1</td>
      <td>1.5</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5.0</td>
      <td>3.6</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>5</th>
      <td>5.4</td>
      <td>3.9</td>
      <td>1.7</td>
      <td>0.4</td>
    </tr>
    <tr>
      <th>6</th>
      <td>4.6</td>
      <td>3.4</td>
      <td>1.4</td>
      <td>0.3</td>
    </tr>
    <tr>
      <th>7</th>
      <td>5.0</td>
      <td>3.4</td>
      <td>1.5</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>8</th>
      <td>4.4</td>
      <td>2.9</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>9</th>
      <td>4.9</td>
      <td>3.1</td>
      <td>1.5</td>
      <td>0.1</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.select_dtypes(include=['number'])
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>sepal length (cm)</th>
      <th>sepal width (cm)</th>
      <th>petal length (cm)</th>
      <th>petal width (cm)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5.1</td>
      <td>3.5</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4.9</td>
      <td>3.0</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>4.7</td>
      <td>3.2</td>
      <td>1.3</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4.6</td>
      <td>3.1</td>
      <td>1.5</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5.0</td>
      <td>3.6</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>145</th>
      <td>6.7</td>
      <td>3.0</td>
      <td>5.2</td>
      <td>2.3</td>
    </tr>
    <tr>
      <th>146</th>
      <td>6.3</td>
      <td>2.5</td>
      <td>5.0</td>
      <td>1.9</td>
    </tr>
    <tr>
      <th>147</th>
      <td>6.5</td>
      <td>3.0</td>
      <td>5.2</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>148</th>
      <td>6.2</td>
      <td>3.4</td>
      <td>5.4</td>
      <td>2.3</td>
    </tr>
    <tr>
      <th>149</th>
      <td>5.9</td>
      <td>3.0</td>
      <td>5.1</td>
      <td>1.8</td>
    </tr>
  </tbody>
</table>
<p>150 rows × 4 columns</p>
</div>




```python
#alterntaive: 
# df.select_dtypes(include=['int64', 'float64'])
```


```python
# df["sepal length (cm)"] #is the sepal length series. 
median = df["sepal length (cm)"].median()
df1 = df[df["sepal length (cm)"] > median]

# Check for any values in the sepal length column greater than median
if (df1["sepal length (cm)"]<=5.8).any():
    print("the operation failed. Try again.")
else: 
    print("The median sepal length is:", median)
```

    The median sepal length is: 5.8



```python
# using query:
df.query("`sepal length (cm)` > @median")
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>sepal length (cm)</th>
      <th>sepal width (cm)</th>
      <th>petal length (cm)</th>
      <th>petal width (cm)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>50</th>
      <td>7.0</td>
      <td>3.2</td>
      <td>4.7</td>
      <td>1.4</td>
    </tr>
    <tr>
      <th>51</th>
      <td>6.4</td>
      <td>3.2</td>
      <td>4.5</td>
      <td>1.5</td>
    </tr>
    <tr>
      <th>52</th>
      <td>6.9</td>
      <td>3.1</td>
      <td>4.9</td>
      <td>1.5</td>
    </tr>
    <tr>
      <th>54</th>
      <td>6.5</td>
      <td>2.8</td>
      <td>4.6</td>
      <td>1.5</td>
    </tr>
    <tr>
      <th>56</th>
      <td>6.3</td>
      <td>3.3</td>
      <td>4.7</td>
      <td>1.6</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>145</th>
      <td>6.7</td>
      <td>3.0</td>
      <td>5.2</td>
      <td>2.3</td>
    </tr>
    <tr>
      <th>146</th>
      <td>6.3</td>
      <td>2.5</td>
      <td>5.0</td>
      <td>1.9</td>
    </tr>
    <tr>
      <th>147</th>
      <td>6.5</td>
      <td>3.0</td>
      <td>5.2</td>
      <td>2.0</td>
    </tr>
    <tr>
      <th>148</th>
      <td>6.2</td>
      <td>3.4</td>
      <td>5.4</td>
      <td>2.3</td>
    </tr>
    <tr>
      <th>149</th>
      <td>5.9</td>
      <td>3.0</td>
      <td>5.1</td>
      <td>1.8</td>
    </tr>
  </tbody>
</table>
<p>70 rows × 4 columns</p>
</div>




```python
numeric_cols = df.select_dtypes(include='number').columns
if len(numeric_cols) > 0: # --> we can also use if numeric_cols.any():
    last_numeric_col = numeric_cols[-1]
    print("Last numeric column:", last_numeric_col)
else:
    print("No numeric columns found")

last_col_max = df[last_numeric_col].max()
max_row = df.loc[df[last_numeric_col].idxmax()]

#check if there are any values greater than this:
if (df[last_numeric_col]>last_col_max).any():
    print("The operation failed. Try again")
else: 
    print("The max value in the last numeric column is:", last_col_max)
    print(f"The corresponding row is:\n{max_row}")

```

    Last numeric column: petal width (cm)
    The max value in the last numeric column is: 2.5
    The corresponding row is:
    sepal length (cm)    6.3
    sepal width (cm)     3.3
    petal length (cm)    6.0
    petal width (cm)     2.5
    Name: 100, dtype: float64



```python

```

## 🔄 **Step 4: Data Cleaning & Transformation**
1. Convert all column names to **lowercase** (or snake_case).
2. Rename at least one column to a more meaningful name (e.g. `petal length (cm)` -> `petal_length`).
3. Add a new column called `"feature_sum"` that contains the **sum of all feature values** for each row.
4. **Normalize** (scale between `0` and `1`) all numeric columns.

```python
# Your code here!
```

> **Tip:** For normalization, consider using:
> ```python
> df_norm = (df - df.min()) / (df.max() - df.min())
> ```

---


```python
df.columns = df.columns.str.lower()
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>sepal length (cm)</th>
      <th>sepal width (cm)</th>
      <th>petal length (cm)</th>
      <th>petal width (cm)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5.1</td>
      <td>3.5</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4.9</td>
      <td>3.0</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>4.7</td>
      <td>3.2</td>
      <td>1.3</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4.6</td>
      <td>3.1</td>
      <td>1.5</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5.0</td>
      <td>3.6</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
  </tbody>
</table>
</div>




```python
df.columns = df.columns.str.lower().str.replace(' ','_').str.replace(r'[^\w]', '', regex=True)
df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>sepal_length_cm</th>
      <th>sepal_width_cm</th>
      <th>petal_length_cm</th>
      <th>petal_width_cm</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5.1</td>
      <td>3.5</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4.9</td>
      <td>3.0</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>4.7</td>
      <td>3.2</td>
      <td>1.3</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4.6</td>
      <td>3.1</td>
      <td>1.5</td>
      <td>0.2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5.0</td>
      <td>3.6</td>
      <td>1.4</td>
      <td>0.2</td>
    </tr>
  </tbody>
</table>
</div>




```python
# df["feature_sum"]=df.sum(axis=1) --> this can only be performed once otherwise will include th enew column each time it's run
df["feature_sum"]=df.drop(columns=['feature_sum'], errors='ignore').sum(axis=1)
# df.drop(columns=['ID', 'C']).sum(axis=1)

df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>sepal_length_cm</th>
      <th>sepal_width_cm</th>
      <th>petal_length_cm</th>
      <th>petal_width_cm</th>
      <th>feature_sum</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5.1</td>
      <td>3.5</td>
      <td>1.4</td>
      <td>0.2</td>
      <td>10.2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>4.9</td>
      <td>3.0</td>
      <td>1.4</td>
      <td>0.2</td>
      <td>9.5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>4.7</td>
      <td>3.2</td>
      <td>1.3</td>
      <td>0.2</td>
      <td>9.4</td>
    </tr>
    <tr>
      <th>3</th>
      <td>4.6</td>
      <td>3.1</td>
      <td>1.5</td>
      <td>0.2</td>
      <td>9.4</td>
    </tr>
    <tr>
      <th>4</th>
      <td>5.0</td>
      <td>3.6</td>
      <td>1.4</td>
      <td>0.2</td>
      <td>10.2</td>
    </tr>
  </tbody>
</table>
</div>




```python
def normalize(df):
    return (df - df.min()) / (df.max() - df.min())

df_normalized = df.apply(normalize)
df_normalized.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>sepal_length_cm</th>
      <th>sepal_width_cm</th>
      <th>petal_length_cm</th>
      <th>petal_width_cm</th>
      <th>feature_sum</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0.222222</td>
      <td>0.625000</td>
      <td>0.067797</td>
      <td>0.041667</td>
      <td>0.150000</td>
    </tr>
    <tr>
      <th>1</th>
      <td>0.166667</td>
      <td>0.416667</td>
      <td>0.067797</td>
      <td>0.041667</td>
      <td>0.091667</td>
    </tr>
    <tr>
      <th>2</th>
      <td>0.111111</td>
      <td>0.500000</td>
      <td>0.050847</td>
      <td>0.041667</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <th>3</th>
      <td>0.083333</td>
      <td>0.458333</td>
      <td>0.084746</td>
      <td>0.041667</td>
      <td>0.083333</td>
    </tr>
    <tr>
      <th>4</th>
      <td>0.194444</td>
      <td>0.666667</td>
      <td>0.067797</td>
      <td>0.041667</td>
      <td>0.150000</td>
    </tr>
  </tbody>
</table>
</div>



## 🚰 **Step 5: Handling Missing Data & Outliers**
1. Check again if there are **missing values**. If so, **decide** whether to drop or fill them.
2. For numeric columns, consider detecting **outliers** (e.g., using **IQR** or **Z-scores**):
   - Calculate the IQR (`Q3 - Q1`).
   - Identify outliers that fall below `(Q1 - 1.5 * IQR)` or above `(Q3 + 1.5 * IQR)`.
3. Decide how to handle outliers (remove them, cap them, or leave as is).

```python
# Your code here!
```

> **Question:** What impact do outliers have on **mean** vs **median**? Which measure is more **robust** to outliers?

---

## 📈 **Step 6: Exploratory Data Analysis (EDA)**
1. **Group** the data by the target variable (if you have one) and calculate the **mean** for each group.
2. Create a **box plot** of one (or more) numeric columns.
3. Generate a **histogram** of the target variable (if categorical) or of any numeric column (if the target is numeric).
4. Use `.value_counts()` on any **categorical** columns (like `target`) to understand class distribution.

```python
# Your code here!
```

> **Challenge:** Try a **scatter plot** or **pairplot** to see the relationships between features. For a quick pairplot:
> ```python
> import seaborn as sns
> sns.pairplot(df, hue='target')
> ```

---

## 🔗 **Step 7: Combining & Merging Data**
1. Create a **second DataFrame** with **random values** (same number of rows) and a matching index. Merge it with your original dataset using:
   - An **inner join**.
   - A **left join**.
2. Experiment with **joining** on the target column (if applicable) or on an **artificial key**.

```python
# Your code here!
```

> **Tip:** When merging, watch out for duplicates or mismatched keys that could affect your row counts.

---

## 🔄 **Step 8: Reshaping Data (Pivot, Melt, and More)**
1. If you have a **long** dataset, try to **pivot** it to get a **wide** format using `pd.pivot_table` or `df.pivot`.
2. Conversely, if you have a **wide** dataset, practice using `.melt()` to make it **long** again.
3. Create a **pivot table** that summarizes at least one numeric feature grouped by a **categorical** variable (e.g., `target`).

```python
# Your code here!
```

> **Challenge:** Experiment with **multi-level** pivot tables or apply multiple aggregate functions (like `mean`, `std`, etc.) in one pivot.

---

## 🎛️ **Step 9: Advanced GroupBy & Apply**
1. Use **`.groupby()`** to compute **multiple aggregates** (e.g., `mean`, `median`, `std`) for each group.
2. Create a **custom function** that transforms or summarizes your data, and apply it group-wise with `.apply()`.
3. Explore **`.agg()`** and **`.transform()`** to see how they differ from **`.apply()`**.

```python
# Your code here!
```

> **Question:** When would you prefer `.apply()` over `.agg()` or `.transform()`?

---

## 🎯 **Step 10: Final Challenge**
1. Write a function that returns the **top 5 rows** where the sum of all numeric columns is **above the 75th percentile** of the overall dataset.
2. **Sort** these rows in descending order based on that sum.
3. Save your final **cleaned dataset** as a `.csv` file.

```python
# Your code here!
```

---

## 🚀 **Bonus Challenges**
1. **Correlation Heatmap:** Use Seaborn or Matplotlib to show correlations between features.
   ```python
   import seaborn as sns
   import matplotlib.pyplot as plt

   plt.figure(figsize=(10, 6))
   sns.heatmap(df.corr(), annot=True, cmap='coolwarm')
   plt.title("Feature Correlation Heatmap")
   plt.show()
   ```
2. **Pairplot Analysis:** Create a pairplot colored by target (if applicable) to see pairwise relationships.
3. **Feature Engineering:** Create new features (e.g., polynomial terms, interaction terms) and see if they reveal new insights.
4. **Time for Stats/ML:** If your dataset is suitable, try a **basic regression or classification** with `sklearn`.

---

## 🎉 **Well Done!**
If you completed this worksheet, you're **well on your way** to mastering Pandas! Try applying these concepts to **real-world datasets** or integrate **machine learning** with `sklearn`.

---
### 📝 **Final Thought:** 
- Write down one topic you still find tricky in Pandas. 
- Identify **one** new function or method you want to explore further. 
- **Action Plan:** Outline **two** specific steps you’ll take to master that function.

> Remember, **practice** is the key to excellence. Keep exploring, keep coding, and have fun! 🚀
```

---

### Suggested Next Steps
- Explore real-world datasets from [Kaggle](https://www.kaggle.com/datasets).
- Practice more advanced **data visualization** with Plotly or Seaborn.
- Dive into **time-series** data if it interests you (e.g., stock prices, weather data).
- Use **GitHub** or **personal projects** to showcase your newfound skills.

**Good luck** on your journey to becoming a Pandas pro! Feel free to modify any tasks based on your interests or the nature of your chosen dataset. Enjoy the learning process!


```python

```
