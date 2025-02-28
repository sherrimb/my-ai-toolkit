# CodeBoxx AI Toolkit

Welcome to the **CodeBoxx AI Toolkit** repository! This is your **comprehensive resource** for mastering data science skills across the CodeBoxx Academy's Applied AI curriculum (AAI-101 through AAI-104). The repository is structured module-by-module to guide you seamlessly through increasingly advanced concepts.

By working through these materials, you'll build skills in data manipulation, analysis, machine learning, and more using Jupyter notebooks and Python libraries like **Pandas**, **Matplotlib**, **spaCy**, and others.

---

## Repository Structure

This repository is organized by AAI modules (101-104), with common datasets and tools centralized for easy access:

```
.
├── AAI-101/                       # Introduction to AI Tools for Developers
│   ├── air_quality_datasets/      # Air quality data files
│   ├── data/                      # Module-specific datasets
│   ├── notebooks/                 # Tutorial & practice notebooks
│   │   ├── tutorials/             # Step-by-step Pandas tutorials
│   │   └── worksheets/            # Practice problems & challenges
│   ├── slides/                    # Course reference materials
│   └── visualizations/            # Generated charts & graphs
│
├── AAI-102/                       # Machine Learning
│   ├── data/                      # Module-specific datasets
│   ├── notebooks/                 # ML tutorial & practice notebooks
│   ├── slides/                    # Course reference materials
│   └── visualizations/            # Generated charts & graphs
│
├── AAI-103/                       # Data Science
│   ├── data/                      # Module-specific datasets
│   ├── notebooks/                 # Data science notebooks
│   ├── slides/                    # Course reference materials
│   └── visualizations/            # Generated charts & graphs
│
├── AAI-104/                       # Feature Engineering
│   ├── data/                      # Module-specific datasets
│   ├── notebooks/                 # Feature engineering notebooks
│   ├── slides/                    # Course reference materials
│   └── visualizations/            # Generated charts & graphs
│
├── common_data/                   # Datasets shared across modules
│   └── elevator_datasets/         # For AAI-102/103 assignments
│
├── common_tools/                  # Reusable utilities & scripts
│   └── helper_scripts/            # Conversion & utility scripts
│
├── misc/                          # Supplementary materials
│   ├── my_spacy_model/            # Trained spaCy model files
│   ├── spacy_examples/            # NLP examples
│   └── uk_house_prices/           # Additional practice datasets
│
└── visualizations/                # Global visualization resources
```

Each module follows a consistent structure, making it easy to navigate and find relevant materials as you progress through the curriculum.

---

## Module by Module Guide

### AAI-101: Introduction to AI Tools for Developers

This module introduces foundational tools for data manipulation and analysis:

1. **Pandas Tutorials** (`AAI-101/notebooks/tutorials/`):
   - **10 Sequential Notebooks** covering core Pandas operations:
     1. `1_pandas_intro.ipynb` - Basic DataFrame operations
     2. `2_read_and_write_tabular_data.ipynb` - Importing and exporting data
     3. `3_selecting_a_subset_of_df.ipynb` - Data filtering and selection
     4. `4_creating_plots.ipynb` - Basic data visualization
     5. `5_new_cols_from_existing_cols.ipynb` - Data transformation
     6. `6_calculating_statistics.ipynb` - Statistical operations
     7. `7_table_reshaping.ipynb` - Reshaping data (pivot, melt)
     8. `8_combining_dataframes.ipynb` - Merging and joining datasets
     9. `9_handling_time_series_data.ipynb` - Time series analysis
     10. `10_manipulating_textual_data.ipynb` - Text manipulation

2. **Practice Worksheets** (`AAI-101/notebooks/worksheets/`):
   - `challenges_101.ipynb` - Practical challenges using student enrollment data
   - `further_challenges_101.ipynb` - Additional practice problems using a **dataset of your choice!**

3. **Datasets** (`AAI-101/data/` and `AAI-101/air_quality_datasets/`):
   - Student and enrollment data (`students.csv`, `enrollments.json`)
   - Titanic passenger data (`titanic.csv`)
   - Air quality datasets (various CSV files)

4. **Visualizations** (`AAI-101/visualizations/`):
   - Example plots and charts created during tutorials

### AAI-102: Machine Learning

This module covers machine learning fundamentals:

- **Notebooks** will guide you through:
  - Classification and regression tasks
  - Model evaluation techniques
  - Working with the Rocket Elevators dataset
  - Data preparation for ML

### AAI-103: Data Science

This module focuses on advanced data analysis and visualization:

- **Notebooks** will explore:
  - Exploratory Data Analysis (EDA)
  - Statistical analysis techniques
  - Data reporting and visualization
  - Building data science workflows with CookieCutter structure

### AAI-104: Feature Engineering

This module introduces advanced techniques for preparing data for ML models:

- **Notebooks** will cover:
  - Feature selection and creation
  - Dimensionality reduction
  - Handling categorical variables
  - Advanced preprocessing techniques

---

## How to Use This Repository

### Getting Started (AAI-101)

1. **Set Up Your Environment**:
   - Install Anaconda (recommended) or Python with pip
   - Ensure Jupyter Notebook/Lab is installed

2. **Learn Pandas Step-by-Step**:
   - Start with the AAI-101 tutorial notebooks in numerical order
   - Run each cell to see code examples in action
   - Experiment by modifying parameters to deepen understanding

3. **Practice with Challenges**:
   - After completing tutorials, move to `challenges_101.ipynb`
   - These exercises mirror real-world data tasks
   - Use the provided datasets in the `data` directory

4. **Reference Materials**:
   - Review slide notes for conceptual explanations

### Path to Advanced Topics (AAI-102, AAI-103, AAI-104)

As you progress through the curriculum:

1. Each module builds on previous knowledge
2. Continue working through notebooks sequentially within each module
3. Common datasets and tools in the centralized folders will be used across modules
4. Explore additional topics like NLP with spaCy when you're ready

---

## Working with Notebooks

### Running Jupyter Notebooks

1. **Clone the repository** to your local machine
2. Navigate to the folder in your terminal
3. Launch Jupyter: `jupyter notebook` or `jupyter lab`
4. Navigate to the appropriate module folder and open the notebook you wish to work with
5. Run cells sequentially (Shift+Enter) to execute code

### Tips for Success

- **Run cells in order**: Many notebooks build on previous cells' results
- **Don't skip tutorials**: Each one introduces important concepts
- **Experiment**: Modify examples to test your understanding
- **Use documentation**: Reference the official [Pandas docs](https://pandas.pydata.org/docs/) when needed
- **Visualize your data**: Use plots to build intuition about your datasets

---

## Module Assignments

Each module has specific deliverables aligned with your CodeBoxx Academy assignments:

### AAI-101 Assignment:
- Complete the worksheets in the AAI-101 notebooks directory
- Create your own notebook demonstrating key Pandas operations
- Submit according to course instructions

### AAI-102 Assignment:
- Work with elevator dataset analyses
- Perform data cleaning and preprocessing tasks
- Merge and analyze datasets for insights

### AAI-103 Assignment:
- Analyze incident data
- Create visualizations and reports
- Implement the CookieCutter data science structure

### AAI-104 Assignment:
- Advanced feature engineering techniques
- Prepare data for production ML systems

---

## Troubleshooting

- **Dependency Issues**: Install missing packages with `pip install` or `conda install`
- **Path Errors**: Ensure you're referencing file paths correctly relative to the notebook location
- **Data Not Found**: Check that you're in the correct directory and datasets are where expected

---

## Resources and References

- **Official Documentation**:
  - [Pandas Documentation](https://pandas.pydata.org/docs/)
  - [Matplotlib Documentation](https://matplotlib.org/)
  - [spaCy Documentation](https://spacy.io/usage)
  
- **Additional Learning**:
  - [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/)
  - [Real Python Tutorials](https://realpython.com/tutorials/data-science/)

---

## Contributing

If you find issues or want to contribute improvements:

1. Open an issue describing the problem or enhancement
2. For code contributions, fork the repository and submit a pull request
3. Follow consistent naming conventions and document your code/notebooks

---

## Questions and Support

- For specific questions about assignments, contact your CodeBoxx instructor
- For technical issues with the repository, open a GitHub issue
- For general Pandas questions, search Stack Overflow or the official documentation

---

Happy learning, and welcome to your journey through AI tools and techniques!