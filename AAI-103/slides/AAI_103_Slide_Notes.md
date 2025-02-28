**Consolidated Document**  
**AAI-103: Data Science**

---

## Table of Contents
1. [Module Overview](#module-overview)  
2. [What is Data Science?](#what-is-data-science)  
   2.1. [Definition and Key Concepts](#definition-and-key-concepts)  
   2.2. [Difference Between Data Science, Machine Learning, and AI](#difference-between-data-science-ml-and-ai)  
3. [The Data Science Workflow](#the-data-science-workflow)  
   3.1. [Data Collection and Preprocessing](#data-collection-and-preprocessing)  
   3.2. [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)  
   3.3. [Modeling and Evaluation](#modeling-and-evaluation)  
   3.4. [Deployment and Monitoring](#deployment-and-monitoring)  
4. [Data Analysis and Reporting](#data-analysis-and-reporting)  
   4.1. [Data-Driven Decision-Making](#data-driven-decision-making)  
   4.2. [Communicating Insights Effectively](#communicating-insights-effectively)  
   4.3. [Data Visualization](#data-visualization)  
5. [AAI-103 Business Document](#aai-103-business-document)  
   5.1. [Summary](#summary)  
   5.2. [Objectives](#objectives)  
   5.3. [Requirements](#requirements)  
       - [Part 4 – Analysis of the Inspected Dataset (`inspection.csv`)](#part-4-analysis-of-inspected-dataset)  
       - [Part 5 – Analysis of the Incident Elevator Dataset (`incident.csv`)](#part-5-analysis-of-incident-elevator-dataset)  
       - [CookieCutter Structure](#cookiecutter-structure)  
       - [Data Reporting](#data-reporting)  
6. [Deliverables](#deliverables)  

---

<a name="module-overview"></a>
## 1. Module Overview
In **AAI-103: Data Science**, you will deepen your understanding of the data science process—from data collection and preprocessing to analysis, reporting, and deployment. You will focus on **incident data**, generating visualizations, and writing concise reports that drive data-driven recommendations.

---

<a name="what-is-data-science"></a>
## 2. What is Data Science?

<a name="definition-and-key-concepts"></a>
### 2.1. Definition and Key Concepts
Data science is an **interdisciplinary field** that involves extracting knowledge and insights from both **structured and unstructured** data. It draws upon:
- **Statistics**
- **Programming**
- **Domain Expertise**

Data scientists engage in activities such as:
- **Data Exploration**  
- **Data Visualization**  
- **Predictive Modeling**  
- **Machine Learning**

Through these methods, data scientists turn **raw data** into **actionable insights** that inform decision-making.

---

<a name="difference-between-data-science-ml-and-ai"></a>
### 2.2. Difference Between Data Science, Machine Learning, and AI
1. **Data Science**  
   - An umbrella term covering the entire process of working with data, including collection, cleaning, analysis, and reporting.  

2. **Machine Learning (ML)**  
   - A subset of data science focused on building models that learn from data to make predictions or decisions without explicit programming.  

3. **Artificial Intelligence (AI)**  
   - A broader concept aimed at creating intelligent machines capable of tasks like reasoning, problem-solving, and natural language understanding.  
   - Machine learning is often a major component, but AI also includes rule-based systems, robotics, and other techniques.

---

<a name="the-data-science-workflow"></a>
## 3. The Data Science Workflow
Typical stages in a data science project include:

<a name="data-collection-and-preprocessing"></a>
### 3.1. Data Collection and Preprocessing
- **Data Collection**: Gather data from multiple sources (databases, APIs, surveys, etc.). Data may be structured (tables, spreadsheets) or unstructured (text, images, audio).  
- **Data Preprocessing**: Ensure data is clean, consistent, and usable. Tasks include:
  - Handling missing values  
  - Converting data into appropriate formats  
  - Scaling or normalizing numerical values  
  - Encoding categorical variables  

High-quality data is essential to produce accurate insights and reliable models.

---

<a name="exploratory-data-analysis-eda"></a>
### 3.2. Exploratory Data Analysis (EDA)
**EDA** involves:
- Investigating data to understand its structure, patterns, and distribution  
- Identifying outliers or anomalies  
- Testing initial hypotheses about relationships between variables  

Common techniques:
- **Descriptive Statistics** (mean, median, mode, standard deviation)  
- **Correlation Analysis**  
- **Visualizations** (histograms, scatter plots, box plots, heatmaps)

EDA guides the next steps in modeling by revealing potential issues and relationships in the data.

---

<a name="modeling-and-evaluation"></a>
### 3.3. Modeling and Evaluation
Once data is ready, **machine learning algorithms** can be applied to learn patterns and make predictions or decisions. This typically involves:
1. **Selecting Models** (regression, classification, clustering, etc.)  
2. **Training the Model** on a training dataset  
3. **Evaluating Performance** on a test set using metrics like accuracy, precision, recall, F1 score, or mean squared error  
4. **Model Tuning** (hyperparameter optimization, feature engineering)  
5. **Cross-Validation** to ensure stability and prevent overfitting

---

<a name="deployment-and-monitoring"></a>
### 3.4. Deployment and Monitoring
After a model is trained and validated:
- **Deployment**: Integrate the model into production (e.g., web service, mobile app, business operations).  
- **Monitoring**: Track model performance (accuracy, speed) over time.  
- **Maintenance**: Retrain or update the model if data patterns change (performance drift).

---

<a name="data-analysis-and-reporting"></a>
## 4. Data Analysis and Reporting

<a name="data-driven-decision-making"></a>
### 4.1. Data-Driven Decision-Making
Organizations increasingly rely on **data-driven** insights for strategic moves. Using real, quantifiable evidence helps:
- **Optimize Resources**  
- **Forecast Outcomes**  
- **Measure Success** over time  
- **Reduce Bias** in decision-making

---

<a name="communicating-insights-effectively"></a>
### 4.2. Communicating Insights Effectively
Clear communication bridges the gap between **technical analysis** and **business action**:
- Tailor language to **non-technical** stakeholders  
- Provide **context** and **key takeaways**  
- Present findings via **reports**, **dashboards**, or **presentations**  
- **Actionable Recommendations** ensure that insights translate into practical next steps

---

<a name="data-visualization"></a>
### 4.3. Data Visualization
Visual aids such as **bar charts**, **line graphs**, **scatter plots**, **heatmaps**, and **dashboards**:
- Reveal **patterns and trends** not easily seen in tables  
- Simplify **complex** data  
- Enhance the **memorability** of insights  
- Guide **faster** and **more informed** decisions

---

<a name="aai-103-business-document"></a>
## 5. AAI-103 Business Document

<a name="summary"></a>
### 5.1. Summary
This document outlines the requirements for **Module 3** of the CodeBoxx **Practical AI** curriculum (now referenced as **AAI-103**). In this module, you will **analyze incident data**, generate visualizations, and prepare reports that provide actionable insights for **Rocket Elevators**.

---

<a name="objectives"></a>
### 5.2. Objectives
- **Explore** additional datasets to gain deeper insights  
- **Generate** a word cloud based on incident narratives  
- **Write** a concise report summarizing findings and recommendations (max 3 pages)  
- **Create** and deliver a presentation to communicate key insights  
- **Replicate** all data manipulations using the **CookieCutter** data science template and maintain work in a **private GitHub repository**

---

<a name="requirements"></a>
### 5.3. Requirements
Rocket Elevators has extensive **elevator data** collected over several years. They want to leverage these insights to improve operations.

**Important**: All exercises must be done **sequentially**.

---

<a name="part-4-analysis-of-inspected-dataset"></a>
#### Part 4 – Analysis of the Inspected Dataset (`inspection.csv`)
1. **4a)** Merge data (*License-Installed* with *Inspected*). Develop a strategy to avoid memory issues and many-to-many relationships. Justify and apply this strategy.  
2. **4b)** Clean the “Inspection Outcome” variable by merging categories with few observations into an “Other” category. Implement this without hard-coding.  
3. **4c)** Calculate the **average number of inspections** per elevator.

---

<a name="part-5-analysis-of-incident-elevator-dataset"></a>
#### Part 5 – Analysis of the Incident Elevator Dataset (`incident.csv`)
1. **5a)** **No merging** required for this task. Create a **word cloud** from the "Reported occurrence narrative" column:  
   - Perform data cleaning (stop words, punctuation removal, lemmatization or stemming)  
   - Use any visualization tool of your choice  
   - The goal is to understand common incident-related terms

---

<a name="cookiecutter-structure"></a>
#### CookieCutter Structure
All data manipulations (Sections 1–3 from the previous module and Sections 4–5 here) must be **replicated** using the **CookieCutter Data Science Template**:
- [Home - Cookiecutter Data Science](https://drivendata.github.io/cookiecutter-data-science/)

Your work should reside in a **private GitHub repository**. Add your coaches as collaborators.

> **Tip**:  
> Focus on using the `/data`, `/notebooks`, `requirements.txt`, and `src/data` folders/files in the template structure.

---

<a name="data-reporting"></a>
#### Data Reporting
After extensive coding and analysis, write a **maximum 3-page report** detailing:
- **Findings** from your analysis  
- **Recommendations** for Rocket Elevators  
- **Visualizations** that support your conclusions  

Ensure the report is **easy to understand** and includes **actionable** steps based on your data-driven insights.

---

<a name="deliverables"></a>
## 6. Deliverables
Submit a **text file** containing:
1. **Your Name**  
2. **A Link to Your Private Repository** with the CookieCutter structure, including:
   - **Datasets** and **Notebooks**  
   - **Answers** to each question (Markdown + Code cells in the Jupyter Notebook)  
   - **Analysis Document** (the 3-page report with visualizations)  

> **Important**: Use only the **"Upload a File"** option to submit these deliverables. Your notebooks must **run without errors** for proper evaluation.

---

**End of Document**