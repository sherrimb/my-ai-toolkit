# File path: ./notebook_tutorials_pandas/tutorials/1_pandas_intro.ipynb


## What is Pandas?

*Pandas* is a powerful, open-source Python library.
- It's designed for data manipulation and analysis and is an essenial tool in Data Science & Machine Learning etc.
- It provides *two* main data structures:
    - DataFrame
    - Series
- Pandas enables efficient, streamlined:
    - writing to varied file formats such as CSV and JSON.
    - data cleaning
    - data transformation
    - conducting complex data operations
- Pandas is intuitive and flexible
- Highly popular among Data Scientists & Analysts for data wrangling, exploration, data prep tasks
- Machine learning models mainly use he pandas DataFrame as an input.
- Using Pandas, being familiar with its syntax, methods, and data manipulation is a ESSENTIAL. 

## What is a DataFrame?

A *DataFrame*:
- is a **2D** *labeled* data structure
- may have columns with different data types
- analogous to a table or spreadsheet (but) in Python
- alllows you to handle data in a structured way, making it easy to manipulate, analyze, visualize data
- After loading your data into a DataFrame you can filter, group, sort, and much much more!

## What kind of data does pandas handle? 
To load the pandas package and start working with it, import the package. The community agreed alias for pandas is pd, so loading pandas as pd is assumed standard practice for all of the pandas documentation.


```python
import pandas as pd
```

Let's say that I want to store passenger data of the Titanic. For a number of passengers, I know the name (characters), age (integers) and sex (male/female) data.


```python
df = pd.DataFrame(
        {
            "Name": [
                "Braund, Mr. Owen Harris",
                "Allen, Mr. William Henry",
                "Bonnell, Miss. Elizabeth",
            ],
            "Age": [22, 35, 58],
            "Sex": ["male", "male", "female"],
        }
    )
    

df 

# In Jupyter notebooks (and other interactive Python/IPython environments), simply typing the variable name in a cell (e.g. df) automatically calls the “display” mechanism, showing a formatted preview of that DataFrame in the notebook.

# In a regular Python script (for example, if you run python file.py from the command line), simply typing a variable name like df does nothing by itself. You would need to explicitly print it, for instance with print(df), to see any output.

# So, in short:

# In a notebook, df on its own line will display the DataFrame (because of the interactive environment’s display hook).
# In a regular Python program, you need print(df) (or some other method) to output or log the DataFrame to the console.
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
      <th>Name</th>
      <th>Age</th>
      <th>Sex</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Braund, Mr. Owen Harris</td>
      <td>22</td>
      <td>male</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Allen, Mr. William Henry</td>
      <td>35</td>
      <td>male</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Bonnell, Miss. Elizabeth</td>
      <td>58</td>
      <td>female</td>
    </tr>
  </tbody>
</table>
</div>



To manually store data in a table, create a DataFrame. 
- When using a Python dictionary of lists:
    - the dict keys will be used as column headers
    - the values in each list will be used as the columns of the DataFrame

**Recap**:
A **DataFrame** is a 2-dimensional structure that can store data of different types (characters, integers, floating points, categorical data etc.) in columns
A **DataFrame** is similar to a spreadsheet, SQL table or data.frame in R.

The table above has:
- 3 columns, each of them with a column label. The column labels are respectively `Name`, `Age` and `Sex`.

- The column `Name` consists of textual data with each value a string, the column `Age` are numbers and the column `Sex`is textual data.

### Each column in a `DataFrame` is a `Series`

So, let's imagine I am only interested in workinmg with the data in the column, `Age`.


```python
df["Age"]
```




    0    22
    1    35
    2    58
    Name: Age, dtype: int64



When selecting a single column of a pandas `DataFrame`, the result is a pandas `Series`. To select the column, use the column label in between square brackets [].

(If you are familiar with Python dictionaries, the selection of a single column is very similar to the selection of dictionary values based on the key.)

If we wanted to, we could also make a pandas `Series` from scratch:`



```python
ages = pd.Series([22,3335,68], name="Age")
ages
```




    0      22
    1    3335
    2      68
    Name: Age, dtype: int64


Notice that a pandas `Series` has no column labels --> it's just a data-centric column of a DataFrame. BUT, a `Series` does have row-labels.
## Do something with a DataFrame or Series

I want to know the maximum Age of the passengers...

we can do this by selecting the `Age` column of the DF and applying the max()


```python
df["Age"].max()

```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    Cell In[1], line 1
    ----> 1 df["Age"].max()


    NameError: name 'df' is not defined


As illustrated by the `max()` method, we can do things with a DataFrame or Series. Pandas provides a lot of functionalities, each of them a method you can apply to a DataFrame or Series. As methods are functions, do not forget to use parentheses (). 

Now, I’m interested in some basic statistics of the numerical data of my data table


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
      <th>Age</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>3.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>38.333333</td>
    </tr>
    <tr>
      <th>std</th>
      <td>18.230012</td>
    </tr>
    <tr>
      <th>min</th>
      <td>22.000000</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>28.500000</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>35.000000</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>46.500000</td>
    </tr>
    <tr>
      <th>max</th>
      <td>58.000000</td>
    </tr>
  </tbody>
</table>
</div>



The `describe()` method provides a quick overview of the numerical data in a DataFrame. As the Name and Sex columns are textual data, these are by default not taken into account by the describe() method.
- Many pandas operations return a DataFrame or a Series. The describe() method is an example of a pandas operation returning a pandas Series or a pandas DataFrame.

This is just a starting point. 
Similar to spreadsheet software, pandas represents data as a table with columns and rows. 
Apart from the representation, also the data manipulations and calculations you would do in spreadsheet software are supported by pandas. 
Continue reading the next tutorials to get started!

**REMEMBER**

- Import the package, aka import pandas as pd

- A table of data is stored as a pandas DataFrame

- Each column in a DataFrame is a Series

- You can do things by applying a method to a DataFrame or Series


```python

```
