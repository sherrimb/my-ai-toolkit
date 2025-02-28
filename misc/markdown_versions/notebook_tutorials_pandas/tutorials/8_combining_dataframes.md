# File path: ./notebook_tutorials_pandas/tutorials/8_combining_dataframes.ipynb



For this tutorial, air quality data about **NO2**
 is used, made available by OpenAQ and downloaded using the py-openaq package.

The air_quality_no2_long.csv data set provides 
 values for the measurement stations FR04014, BETR801 and London Westminster in respectively Paris, Antwerp and London.

Let's start by importing the packages and reading the data into a pandas DataFrame.


```python
import pandas as pd
import openaq as oaq
```


```python
air_quality_no2 = pd.read_csv("../data/air_quality_no2_long.csv", parse_dates=True)
```

Then, let's select only the relevant columns from our dataset. We are interested in the timestamp of the measurement (`date.utc`), the location where it was recorded (`location`), the type of air quality parameter measured (`parameter`), and the recorded value (`value`). 

This will help us focus on the essential data needed for further analysis & manipulation. 



```python
air_quality_no2 = air_quality_no2[["date.utc", "location", "parameter", "value"]]
```

Now, let's get a quick look at the data



```python
air_quality_no2.head()
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
      <th>date.utc</th>
      <th>location</th>
      <th>parameter</th>
      <th>value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2019-06-21 00:00:00+00:00</td>
      <td>FR04014</td>
      <td>no2</td>
      <td>20.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2019-06-20 23:00:00+00:00</td>
      <td>FR04014</td>
      <td>no2</td>
      <td>21.8</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2019-06-20 22:00:00+00:00</td>
      <td>FR04014</td>
      <td>no2</td>
      <td>26.5</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2019-06-20 21:00:00+00:00</td>
      <td>FR04014</td>
      <td>no2</td>
      <td>24.9</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2019-06-20 20:00:00+00:00</td>
      <td>FR04014</td>
      <td>no2</td>
      <td>21.4</td>
    </tr>
  </tbody>
</table>
</div>



For this tutorial also, air quality data about Particulate matter less than 2.5 micrometers is used, made available by [OpenAQ](https://openaq.org) and downloaded using the [py-openaq](https://pypi.org/project/py-openaq/) package.

The `air_quality_pm25_long.csv` data set provides *PM₂₅* values for the measurement stations *FR04014*, *BETR801* and *London Westminster* in respectively Paris, Antwerp and London.



```python
air_quality_pm25 = pd.read_csv("../data/air_quality_pm25_long.csv", parse_dates=True)
```


```python
air_quality_pm25 = air_quality_pm25[["date.utc", "location",
                                     "parameter", "value"]]
```


```python
air_quality_pm25.head()
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
      <th>date.utc</th>
      <th>location</th>
      <th>parameter</th>
      <th>value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2019-06-18 06:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2019-06-17 08:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>6.5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2019-06-17 07:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>18.5</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2019-06-17 06:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2019-06-17 05:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>7.5</td>
    </tr>
  </tbody>
</table>
</div>



## How to combine data from multiple tables
#### Concatenating objects

![image.png](8_combining_dataframes_files/c2a497b4-3169-4b38-960a-605cc3c19879.png)

### Combining Measurements of NO₂ and PM₂.₅

Let's say that we want to now *combine* the measurements of *NO₂* and *PM₂.₅*, which are stored in two separate tables with a similar structure, into a single table.


```python
air_quality = pd.concat([air_quality_pm25, air_quality_no2], axis=0)
```


```python
air_quality.head()
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
      <th>date.utc</th>
      <th>location</th>
      <th>parameter</th>
      <th>value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2019-06-18 06:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2019-06-17 08:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>6.5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2019-06-17 07:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>18.5</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2019-06-17 06:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2019-06-17 05:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>7.5</td>
    </tr>
  </tbody>
</table>
</div>



The `concat()` function in pandas allows us to merge multiple tables along a specified axis — either *row-wise* or *column-wise*.
* By default, concatenation is along axis 0
* Therefore, resulting table combines the rows of the input tables
* Think 'vertical stack'.

Let's check the shape of th eoriginal vs. concatenated tables to verify the operation result: 


```python
print('Shape of the ``air_quality_pm25`` table: ', air_quality_pm25.shape)
```

    Shape of the ``air_quality_pm25`` table:  (1110, 4)



```python
print('Shape of the ``air_quality_no2`` table: ', air_quality_no2.shape)
```

    Shape of the ``air_quality_no2`` table:  (2068, 4)



```python
print('Shape of the resulting ``air_quality`` table: ', air_quality.shape)
```

    Shape of the resulting ``air_quality`` table:  (3178, 4)


> **Result:**  
> The final table has **3178 rows**, which is the sum of the original tables: **1110 + 2068**.

> 📝 **Note:**  
> The `axis` argument is widely used in pandas functions. A `DataFrame` has two axes:
> - **axis=0**: Runs vertically, across rows.
> - **axis=1**: Runs horizontally, across columns.  
> Most operations, like concatenation and summary statistics, default to `axis=0` (rows), but they can also be applied across columns when needed.


### Maintaining the Origin of Data

Sorting the combined table by datetime (`date.utc`) allows us to see how the data from both tables merge. The `parameter` column helps distinguish between the two original tables:
- `"no2"` from `air_quality_no2`
- `"pm25"` from `air_quality_pm25`




```python
air_quality = air_quality.sort_values("date.utc")
air_quality.head()
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
      <th>date.utc</th>
      <th>location</th>
      <th>parameter</th>
      <th>value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>2067</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>London Westminster</td>
      <td>no2</td>
      <td>23.0</td>
    </tr>
    <tr>
      <th>1003</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>FR04014</td>
      <td>no2</td>
      <td>25.0</td>
    </tr>
    <tr>
      <th>100</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>12.5</td>
    </tr>
    <tr>
      <th>1098</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>BETR801</td>
      <td>no2</td>
      <td>50.5</td>
    </tr>
    <tr>
      <th>1109</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>London Westminster</td>
      <td>pm25</td>
      <td>8.0</td>
    </tr>
  </tbody>
</table>
</div>



In this example, the `parameter` column ensures that we can identify where each data point came from. However, this is not always the case. 

The `concat` function provides a convenient solution with the `keys` argument, adding an additional (hierarchical) row index.

For example:


```python
air_quality_ = pd.concat([air_quality_pm25, air_quality_no2], keys=["PM25", "NO2"])
```


```python
air_quality_.head(100000)
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
      <th></th>
      <th>date.utc</th>
      <th>location</th>
      <th>parameter</th>
      <th>value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="5" valign="top">PM25</th>
      <th>0</th>
      <td>2019-06-18 06:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>18.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2019-06-17 08:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>6.5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2019-06-17 07:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>18.5</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2019-06-17 06:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2019-06-17 05:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>7.5</td>
    </tr>
    <tr>
      <th>...</th>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th rowspan="5" valign="top">NO2</th>
      <th>2063</th>
      <td>2019-05-07 06:00:00+00:00</td>
      <td>London Westminster</td>
      <td>no2</td>
      <td>26.0</td>
    </tr>
    <tr>
      <th>2064</th>
      <td>2019-05-07 04:00:00+00:00</td>
      <td>London Westminster</td>
      <td>no2</td>
      <td>16.0</td>
    </tr>
    <tr>
      <th>2065</th>
      <td>2019-05-07 03:00:00+00:00</td>
      <td>London Westminster</td>
      <td>no2</td>
      <td>19.0</td>
    </tr>
    <tr>
      <th>2066</th>
      <td>2019-05-07 02:00:00+00:00</td>
      <td>London Westminster</td>
      <td>no2</td>
      <td>19.0</td>
    </tr>
    <tr>
      <th>2067</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>London Westminster</td>
      <td>no2</td>
      <td>23.0</td>
    </tr>
  </tbody>
</table>
<p>3178 rows × 4 columns</p>
</div>



> 📝 **Note:**

>The existence of multiple row/column indices at the same time has not been mentioned within these tutorials.
> Hierarchical indexing (or *MultiIndex*) is a powerful pandas feature for handling high-dimensional data. While not covered in detail in this tutorial, remember that you can always flatten multi-level indices using `reset_index()`, e.g.:
> ```python
> air_quality.reset_index(level=0)
> ```
> Check out the [advanced indexing](https://pandas.pydata.org/pandas-docs/stable/user_guide/advanced.html) guide for more details.

## Join tables using a common identifier

To enrich our dataset, let's **add station coordinates** from the metadata table to the measurements table.

![image.png](8_combining_dataframes_files/9e905f7c-805a-4b47-a357-b0b2a539682f.png)


```python
stations_coord = pd.read_csv("../data/air_quality_stations.csv")
```


```python
stations_coord.head()
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
      <th>location</th>
      <th>coordinates.latitude</th>
      <th>coordinates.longitude</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>BELAL01</td>
      <td>51.23619</td>
      <td>4.38522</td>
    </tr>
    <tr>
      <th>1</th>
      <td>BELHB23</td>
      <td>51.17030</td>
      <td>4.34100</td>
    </tr>
    <tr>
      <th>2</th>
      <td>BELLD01</td>
      <td>51.10998</td>
      <td>5.00486</td>
    </tr>
    <tr>
      <th>3</th>
      <td>BELLD02</td>
      <td>51.12038</td>
      <td>5.02155</td>
    </tr>
    <tr>
      <th>4</th>
      <td>BELR833</td>
      <td>51.32766</td>
      <td>4.36226</td>
    </tr>
  </tbody>
</table>
</div>



> **How?**  
> - We use the `merge()` function to join the **air quality data** (`air_quality`) with the **station coordinates** (`stations_coord`).
> - Both tables share a common column: `"location"`, which acts as the key.
> - A **left join** ensures we retain all locations present in the `air_quality` table.

> 📝 **Note:**  
> The dataset contains measurements for only three stations (*FR04014, BETR801, and London Westminster*). The join operation will only add coordinates for these stations to the dataset.



```python
air_quality = pd.merge(air_quality, stations_coord, how= "left", on="location")
```


```python
air_quality.head()
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
      <th>date.utc</th>
      <th>location</th>
      <th>parameter</th>
      <th>value</th>
      <th>coordinates.latitude</th>
      <th>coordinates.longitude</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>London Westminster</td>
      <td>no2</td>
      <td>23.0</td>
      <td>51.49467</td>
      <td>-0.13193</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>FR04014</td>
      <td>no2</td>
      <td>25.0</td>
      <td>48.83724</td>
      <td>2.39390</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>FR04014</td>
      <td>no2</td>
      <td>25.0</td>
      <td>48.83722</td>
      <td>2.39390</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>12.5</td>
      <td>51.20966</td>
      <td>4.43182</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>BETR801</td>
      <td>no2</td>
      <td>50.5</td>
      <td>51.20966</td>
      <td>4.43182</td>
    </tr>
  </tbody>
</table>
</div>



Let's recap what this operation has 'done'.

* Using the `merge()` fucntion, for *each of the rows* in the `air_quality` DF, the corresponding coordinates are added *from* the `stations_coord` table. 

* Both tables have the column `location` in common which is used as a **key** to combine the information.

* By choosing the `left` join, **only** the locations avaialble in the air_quality (left) table, i.e., from FR04014, BETR801 and London Westminster, end up in the resulting table.

* The `merge` function supports multiple join options similar to database-style operations.


And, finally, let's add the parameters' full description and name , provided by the parameters metadata table *to* the measurmens table. 


```python
air_quality_parameters = pd.read_csv("../data/air_quality_parameters.csv")

air_quality_parameters.head()
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
      <th>id</th>
      <th>description</th>
      <th>name</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>bc</td>
      <td>Black Carbon</td>
      <td>BC</td>
    </tr>
    <tr>
      <th>1</th>
      <td>co</td>
      <td>Carbon Monoxide</td>
      <td>CO</td>
    </tr>
    <tr>
      <th>2</th>
      <td>no2</td>
      <td>Nitrogen Dioxide</td>
      <td>NO2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>o3</td>
      <td>Ozone</td>
      <td>O3</td>
    </tr>
    <tr>
      <th>4</th>
      <td>pm10</td>
      <td>Particulate matter less than 10 micrometers in...</td>
      <td>PM10</td>
    </tr>
  </tbody>
</table>
</div>




```python
air_quality = pd.merge(air_quality, air_quality_parameters, how='left', left_on='parameter', right_on='id')
```


```python
air_quality.head()
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
      <th>date.utc</th>
      <th>location</th>
      <th>parameter</th>
      <th>value</th>
      <th>coordinates.latitude</th>
      <th>coordinates.longitude</th>
      <th>id</th>
      <th>description</th>
      <th>name</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>London Westminster</td>
      <td>no2</td>
      <td>23.0</td>
      <td>51.49467</td>
      <td>-0.13193</td>
      <td>no2</td>
      <td>Nitrogen Dioxide</td>
      <td>NO2</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>FR04014</td>
      <td>no2</td>
      <td>25.0</td>
      <td>48.83724</td>
      <td>2.39390</td>
      <td>no2</td>
      <td>Nitrogen Dioxide</td>
      <td>NO2</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>FR04014</td>
      <td>no2</td>
      <td>25.0</td>
      <td>48.83722</td>
      <td>2.39390</td>
      <td>no2</td>
      <td>Nitrogen Dioxide</td>
      <td>NO2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>BETR801</td>
      <td>pm25</td>
      <td>12.5</td>
      <td>51.20966</td>
      <td>4.43182</td>
      <td>pm25</td>
      <td>Particulate matter less than 2.5 micrometers i...</td>
      <td>PM2.5</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2019-05-07 01:00:00+00:00</td>
      <td>BETR801</td>
      <td>no2</td>
      <td>50.5</td>
      <td>51.20966</td>
      <td>4.43182</td>
      <td>no2</td>
      <td>Nitrogen Dioxide</td>
      <td>NO2</td>
    </tr>
  </tbody>
</table>
</div>



Unlike before, this time we don’t have a column with an identical name in both tables. Instead:
- The `parameter` column in the `air_quality` table corresponds to the `id` column in the `air_quality_parameters_name` table.
- To merge them, we used `left_on="parameter"` and `right_on="id"` instead of the default `on=` argument.

i.e.,

Compared to the previous example, there is no common column name. However, the `parameter` column in the `air_quality` table and the `id` column in the `air_quality_parameters_name` both provide the measured variable in a common format. The `left_on` and `right_on` arguments are used here (instead of just `on`) to make the link between the two tables.

## 🔹 REMEMBER

- Multiple tables can be concatenated **both column-wise and row-wise** using the `concat` function.
- For **database-like merging/joining** of tables, use the `merge` function.


```python

```


```python

```
