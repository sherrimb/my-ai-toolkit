**Consolidated Document**  
**AAI-102: Machine Learning**

---

## Table of Contents
1. [Module Overview](#module-overview)  
2. [Introduction to Machine Learning](#introduction-to-machine-learning)  
   2.1. [What is Machine Learning?](#what-is-machine-learning)  
   2.2. [Difference Between Traditional Programming and ML](#difference-between-traditional-programming-and-ml)  
   2.3. [Categories of Machine Learning](#categories-of-machine-learning)  
   2.4. [Real-World Examples and Applications](#real-world-examples-and-applications)  
3. [Why Data Preparation is Crucial for ML](#why-data-preparation-is-crucial-for-ml)  
   3.1. [The Role of Data in ML Performance](#the-role-of-data-in-ml-performance)  
   3.2. [Common Data Issues](#common-data-issues)  
   3.3. [Overview of the Data Preprocessing Workflow](#overview-of-the-data-preprocessing-workflow)  
4. [Understanding the Datasets in This Module](#understanding-the-datasets-in-this-module)  
   4.1. [Structured vs. Unstructured Data](#structured-vs-unstructured-data)  
   4.2. [Datasets Overview](#datasets-overview)  
   4.3. [Why Merging Datasets and Resolving Inconsistencies is Essential](#why-merging-datasets-and-resolving-inconsistencies-is-essential)  
5. [Real-World Relevance of Elevator Data in AI](#real-world-relevance-of-elevator-data-in-ai)  
   5.1. [Predictive Maintenance](#predictive-maintenance)  
   5.2. [Operational Efficiency](#operational-efficiency)  
   5.3. [Regulatory Compliance](#regulatory-compliance)  
6. [Module 2 Business Document](#module-2-business-document)  
   6.1. [Summary](#summary)  
   6.2. [Objectives](#objectives)  
   6.3. [Requirements](#requirements)  
       6.3.1. [Part 1 – License Dataset Analysis (licence.csv)](#part-1--license-dataset-analysis-licencecsv)  
       6.3.2. [Part 2 – Installed Dataset Analysis (installed.json)](#part-2--installed-dataset-analysis-installedjson)  
       6.3.3. [Part 3 – Altered Dataset Analysis (altered.json)](#part-3--altered-dataset-analysis-alteredjson)  
   6.4. [Deliverables](#deliverables)  
7. [Elevator Data Link](#elevator-data-link)  

---

<a name="module-overview"></a>
## 1. Module Overview
This module (**AAI-102: Machine Learning**) covers foundational concepts of machine learning, highlighting real-world applications and practical steps in preparing data for analysis. You will learn about the importance of **data collection**, **data cleaning**, **data transformation**, and **dataset merging** in building robust machine learning solutions.

The module content is divided into four main sections:
1. **Introduction to Machine Learning**
2. **Why Data Preparation is Crucial**
3. **Understanding the Datasets in This Module**
4. **Real-World Relevance of Elevator Data in AI**

Afterward, you’ll find the **Business Document** outlining the specific tasks and deliverables required for successfully completing Module 2.

---

<a name="introduction-to-machine-learning"></a>
## 2. Introduction to Machine Learning

<a name="what-is-machine-learning"></a>
### 2.1. What is Machine Learning?
Machine learning (ML) is a branch of artificial intelligence (AI) that enables computers to learn from data and make predictions or decisions without explicit programming. ML models improve over time by recognizing patterns in historical data, allowing them to generalize to new, unseen data.

#### Key Evolution Milestones
- **1950s**:  
  - Alan Turing proposed the Turing Test.  
  - Arthur Samuel created a checkers program that learned from experience.
- **1960s–1980s**:  
  - Early neural networks (perceptrons) were explored, but faced limitations on complex tasks.  
  - Expert systems used hand-crafted rules but could not handle large, evolving data.
- **1990s**:  
  - Shift towards data-driven, statistical methods (e.g., Decision Trees, Support Vector Machines).  
  - Digital data availability increased model effectiveness.
- **2000s**:  
  - Internet boom and big data.  
  - Companies like Google, Amazon used ML for search algorithms, recommendations, and ads.
- **2010s–Present**:  
  - Emergence of deep learning with advanced neural networks.  
  - Breakthroughs in image recognition, speech processing, self-driving cars.  
  - Everyday AI tools like Siri, Alexa, ChatGPT became mainstream.

---

<a name="difference-between-traditional-programming-and-ml"></a>
### 2.2. Difference Between Traditional Programming and ML
- **Traditional Programming**:  
  - Rule-based.  
  - Developers write explicit instructions (e.g., “If an email has the word ‘lottery,’ mark it as spam.”).  
  - Limited in adapting to new patterns without manual rule updates.

- **Machine Learning**:  
  - Data-driven.  
  - Models learn patterns from labeled examples (e.g., spam vs. non-spam emails).  
  - Can adapt and improve over time as more data becomes available.

---

<a name="categories-of-machine-learning"></a>
### 2.3. Categories of Machine Learning
**1. Supervised Learning**  
   - Learns from labeled data.  
   - Example: Predicting house prices.  
   - Algorithms: Linear Regression, Decision Trees, Neural Networks.

**2. Unsupervised Learning**  
   - Learns patterns from unlabeled data.  
   - Example: Clustering customers by purchasing behavior.  
   - Algorithms: K-Means Clustering, Principal Component Analysis.

**3. Reinforcement Learning**  
   - Learns by trial and error with rewards or penalties.  
   - Example: Training an AI to play chess.  
   - Algorithms: Q-Learning, Deep Q-Networks (DQN).

---

<a name="real-world-examples-and-applications"></a>
### 2.4. Real-World Examples and Applications
- **Healthcare**: Early disease detection from medical images and diagnostics support.  
- **Finance**: Fraud detection, credit scoring, automated trading.  
- **Retail & Entertainment**: Personalized product/content recommendations (Amazon, Netflix).  
- **Manufacturing**: Predictive maintenance using sensor data to reduce downtime.  
- **Autonomous Vehicles**: Real-time image recognition and decision-making (self-driving cars).

---

<a name="why-data-preparation-is-crucial-for-ml"></a>
## 3. Why Data Preparation is Crucial for ML

<a name="the-role-of-data-in-ml-performance"></a>
### 3.1. The Role of Data in ML Performance
Data quality directly impacts a model’s performance. A well-structured, accurate dataset allows the model to learn meaningful patterns, leading to reliable predictions. The principle of **"garbage in, garbage out"** highlights that poor data quality will yield poor model outcomes, no matter how advanced the algorithm.

---

<a name="common-data-issues"></a>
### 3.2. Common Data Issues
- **Missing Values**: Often caused by incomplete data entry. Can be imputed (e.g., mean, median) or dropped.  
- **Inconsistencies**: Varying formats (e.g., "New York" vs. "NY") or date formats (MM/DD/YYYY vs. DD/MM/YYYY). Requires standardization.  
- **Duplicates**: Multiple entries of the same data. Leads to bias if not removed.

---

<a name="overview-of-the-data-preprocessing-workflow"></a>
### 3.3. Overview of the Data Preprocessing Workflow
1. **Collection**: Gathering data from databases, spreadsheets, APIs, or manual input.  
2. **Cleaning**: Handling missing values, inconsistencies, and duplicates.  
3. **Transformation**: Scaling/normalizing numerical features, engineering new features, or adjusting existing ones. Ensures the data format aligns with the model’s requirements.

---

<a name="understanding-the-datasets-in-this-module"></a>
## 4. Understanding the Datasets in This Module

<a name="structured-vs-unstructured-data"></a>
### 4.1. Structured vs. Unstructured Data
- **Structured Data**: Organized in tables with rows/columns (e.g., CSV or relational databases). Easier to filter, sort, merge.  
- **Unstructured Data**: Free-form text, images, audio (e.g., the “Reported occurrence narrative” field in `incident.csv`). Requires more pre-processing (tokenization, removing stop words, etc.).

---

<a name="datasets-overview"></a>
### 4.2. Datasets Overview
You will work with five datasets related to elevators:
1. **licence.csv**  
   - Licensing info (status, expiration dates).  
   - Useful for tracking license validity and operational status.
2. **installed.json**  
   - Elevators’ installation details (location, date).  
   - JSON format, may contain nested or hierarchical structures.
3. **altered.json**  
   - Information on elevator alterations (upgrades, changes in usage).  
   - JSON format, potentially nested data.
4. **inspection.csv**  
   - Inspection details (outcomes, dates).  
   - Helps analyze frequency and outcomes of elevator inspections.
5. **incident.csv**  
   - Records of elevator incidents (free-text descriptions).  
   - Unstructured data in the “Reported occurrence narrative” column.

Combining these datasets provides a 360-degree view of each elevator’s lifecycle.

---

<a name="why-merging-datasets-and-resolving-inconsistencies-is-essential"></a>
### 4.3. Why Merging Datasets and Resolving Inconsistencies is Essential
- **Integrating Data for a Full Picture**:  
  Connecting `licence.csv` with `installed.json` can reveal how license status correlates with installation details.
- **Resolving Inconsistencies**:  
  Align different naming conventions or date formats (e.g., “New York” vs. “NY”).
- **Avoiding Data Loss**:  
  Careful merging ensures data completeness—for example, preserving information about elevators that haven’t been altered yet.

---

<a name="real-world-relevance-of-elevator-data-in-ai"></a>
## 5. Real-World Relevance of Elevator Data in AI

<a name="predictive-maintenance"></a>
### 5.1. Predictive Maintenance
By analyzing sensor data, inspection records, and maintenance logs, AI can:
- Predict potential failures (e.g., abnormal vibrations, temperature spikes).  
- Schedule maintenance more effectively, reducing unexpected breakdowns.  
- Lower costs and downtime through targeted interventions.

---

<a name="operational-efficiency"></a>
### 5.2. Operational Efficiency
AI helps:
- Optimize elevator dispatching based on usage patterns (e.g., rush hour scheduling).  
- Monitor energy consumption to find cost-saving opportunities.  
- Improve user experience by reducing wait times and idle journeys.

---

<a name="regulatory-compliance"></a>
### 5.3. Regulatory Compliance
- Continuous monitoring of inspection logs, licenses, and maintenance records.  
- Automated flagging of potential safety issues.  
- Streamlined tracking of inspection dates and regulatory standards.

---

<a name="module-2-business-document"></a>
## 6. Module 2 Business Document

<a name="summary"></a>
### 6.1. Summary
This document outlines the requirements for **Module 2** of the CodeBoxx **Practical AI** curriculum. In this module, you will be introduced to **machine learning** concepts and will focus on **preparing and manipulating data** for subsequent data analysis and ML tasks.

<a name="objectives"></a>
### 6.2. Objectives
- **Collect and load data**  
- **Perform data cleaning and filtering operations**  
- **Prepare the data for data analysis and machine learning tasks**

---

<a name="requirements"></a>
### 6.3. Requirements
Rocket Elevators has been collecting operational data for several years. They aim to adopt digital tools to leverage this data, and they need your assistance. Important: **all exercises must be done sequentially**.

---

<a name="part-1--license-dataset-analysis-licencecsv"></a>
#### 6.3.1. Part 1 – License Dataset Analysis (licence.csv)

1. **1a)** Using a variable in the dataset, determine how to uniquely identify each elevator. The chosen variable must also be found in the other datasets to track the elevator throughout its lifespan. Justify your choice with code.

2. **1b)** Identify where the majority of elevators are located. Extract the country and state/province into two new columns using a Pandas method.

3. **1c)** Determine how to filter the “LICENSE STATUS” variable. Apply the filter and overwrite the DataFrame. Justify your choice of filter.

4. **1d)** Verify, using code, if the variable chosen in question 1a is indeed unique.

5. **1e)** Using the “LICENSE EXPIRY DATE” variable, plot a time series showing the count of expirations by month. Avoid hard-coding month values.

6. **1f)** Create a table counting expirations by year and month (e.g., `2015-01`, `2015-02`). Add a column that displays the year-month format (e.g., "January 2015") for readability. Only include rows with more than five occurrences.

---

<a name="part-2--installed-dataset-analysis-installedjson"></a>
#### 6.3.2. Part 2 – Installed Dataset Analysis (installed.json)

1. **2a)** Merge the **filtered rows** (from question 1c) in the License dataset with the installed dataset. Determine how many rows come from each dataset and the total number of rows in the merged dataset.

2. **2b)** Compare the location variables in both datasets. Identify observations where these variables are not equal. Describe your observations.

3. **2c)** What information from the location data can you extract to compare the two columns? Is there a variable you could use to filter the dataset? Apply that filter and overwrite the DataFrame.

4. **2d)** Identify another variable to further filter the dataset; apply the filter and overwrite the DataFrame.

5. **2e)** Identify a variable with more than 5 categories that need cleaning. The goal is to reduce the number of categories (variable from the installed dataset).

---

<a name="part-3--altered-dataset-analysis-alteredjson"></a>
#### 6.3.3. Part 3 – Altered Dataset Analysis (altered.json)

1. **3a)** Merge the previously merged dataset with the **altered** dataset, retaining information even if elevators were not altered.

2. **3b)** Identify elevators with **more than 5 alterations** and display all rows related to those elevators.

3. **3c)** Determine and count the different combinations of “Alteration Type” and “Status of Alteration Request”.

---

<a name="deliverables"></a>
### 6.4. Deliverables
Submit a **zip file** containing:
1. **Your Jupyter Notebook**, which must:
   - Provide answers to each question in **Markdown cells**.  
   - Contain **Code cells** below each question’s Markdown with the solution.  
   - Run **without errors** when executed.
2. **The provided dataset(s)**:
   - Ensure the data files are included so your notebook can be executed locally.

> **Important**: Use only the “**Upload a File**” option to submit your deliverables.

---

<a name="elevator-data-link"></a>
## 7. Elevator Data Link
You can download the elevator data from the provided link. Use Pandas within a Jupyter Notebook to load, manipulate, and analyze these files. This setup allows you to perform real-time data operations and visualize your results in an interactive environment.

---

**End of Document**