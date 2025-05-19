# Walmart Sales Data Analysis: Uncovering Business Insights with Python and SQL


## Overview

This project delivers an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. Leveraging the power of Python for robust data loading, cleaning and pre-processing alongside the advanced querying capabilities of PostgreSQL to showcases the development of a data pipeline, encompassing data manipulation, advanced SQL querying for insight generation, and ultimately providing actionable intelligence for business decision-making. Ideal for data analysts aiming to develop skills in data handling and SQL-driven analysis.

## Data Source: 

The dataset is aquired from kaggle.com and stored in `walmart.csv` file. This dataset hass 10000 rows. Features:

- invoice_id - Invoice unique identifier
- branch - Store branch name
- city - City where the branch is located
- category - Category of the product sold
- unit_price - Price of a single unit of the product
- quantity - Number of units sold in the invoice
- date - Date of the sales transaction
- time - Time of the sales transaction
- payment_method - Method used for payment
- rating - Customer rating of the purchase
- profit_margin - Percentage of profit on the sale
- invoice_total - Total value of the invoice
- total_profit - Total profit for the invoice
- month - Month of the sales transaction
- year - Year of the sales transaction


## Tools used :

- Visual Studio Code
- Python
  - kaggle
  - pandas
  - sqlalchemy
  - psycopg2
- PostgreSQL


## Steps :

### 1. Aquiring the Dataset

  - Aquire the Kaggle API token for the profile.
  - Place the donwloaded  `.json` file in the `.kaggle` folder the must be created inside the user directory.
  - In VS code create a virtual environment `python -m venv walmart_env`.
  - Download the dataset, type in terminal `kaggle datasets download -d <link of the dataset>`.
  - Unzip the `walmart-10k-sales-datasets.zip`.

### 2. Load & Explore the data

  - Load the dataset into `df_walmart`.
  - Using functions like `head()`, `tail()`, `info()` and `describer()` to explore the dataset.

### 3. Data Cleaning and Pre-processing

  - Since `unit_price` and `quantity` column has missing values, so these records are dropped.
  - Drop the duplicate values.
  - Removing $ symbol from unit price and then changing its data type to float type.
  - Adding `invoice_total` column where invoice_total = unit_price * quantity.
  - Adding `total_profit` column where total_profit = invoice_total * profit_margin.
  - Changing the data type of `date` column from object to date time (format = '%d%m%y').
  - Adding month name and year column.

### 4. Load data into PostgreSQL

  - `sqlalchemy` and `psycopg2` to load the data into PostgreSQL.
  - Save the file to `.csv` file


## Analysis with SQL

- Identifying the top-selling product categories in each city and branch.
- Analyzing sales trends over different months and years to identify seasonality.
- Determining the most popular payment methods.
- Calculating average customer ratings for various product categories and branches.
- Identifying the most profitable product categories and branches.


## Getting Started

1.  **Clone the repository** (if you have one).
2.  **Set up the virtual environment:**
    ```bash
    python -m venv walmart_env
    source walmart_env/bin/activate  # On Linux/macOS
    .\walmart_env\Scripts\activate  # On Windows
    ```
3.  **Install dependencies:**
    ```bash
    pip install pandas sqlalchemy psycopg2-binary kaggle
    ```
4.  **Configure Kaggle API:** Ensure your `kaggle.json` file is in the `~/.kaggle` directory.
5.  **Set up PostgreSQL:** Make sure you have PostgreSQL installed and running. You'll need your database credentials to connect.
6.  **Run your Python script** that performs the data loading, cleaning, pre-processing, and loading into PostgreSQL.
7.  **Use a SQL client** (like pgAdmin or DBeaver) to connect to your PostgreSQL database and execute the analysis queries.

## Acknowledgements

- The Walmart Sales Dataset was obtained from [Kaggle](https://www.kaggle.com/).
- The development of this project benefited from the excellent documentation and resources of the Python libraries used (pandas, SQLAlchemy, psycopg2).
