# Indian-Road-Accident-SQL-Analysis
Indian road accident data analysis using MySQL — 50 SQL queries covering trends, fatalities, injuries, aggregations, subqueries, CTEs, and window functions.
# Indian Road Accident SQL Analysis

## Project Overview

This project analyzes historical road accident data in India using MySQL.

The objective of this project is to explore accident trends, fatalities, injuries, and accident-related indicators across the available years using SQL.

The project contains 50 SQL analysis questions ranging from basic aggregation to advanced SQL concepts such as subqueries, CTEs, and window functions.

---

## Dataset

- Dataset: Indian Road Accident Data
- Records: 29 selected yearly records
- Period Covered: 1970–2019
- Database: MySQL
- Main Table: `road_accidents`

### Main Columns

- `year`
- `total_accidents`
- `persons_killed`
- `persons_injured`
- `population_thousands`
- `registered_vehicles_thousands`
- `road_length_km`
- `accidents_per_lakh_population`
- `accidents_per_10000_vehicles`
- `accidents_per_10000_km_roads`
- `killed_per_lakh_population`
- `killed_per_10000_vehicles`
- `killed_per_10000_km_roads`
- `injured_per_lakh_population`
- `injured_per_10000_vehicles`
- `injured_per_10000_km_roads`

---

## Project Objectives

The project focuses on:

- Analyzing yearly accident trends
- Identifying years with the highest accident counts
- Analyzing fatalities and injuries
- Comparing accident statistics across different periods
- Calculating averages, totals, and percentage changes
- Identifying years above average accident and fatality levels
- Performing year-over-year analysis
- Ranking years using window functions
- Extracting meaningful insights from the dataset

---

## SQL Skills Used

### Basic SQL

- SELECT
- WHERE
- ORDER BY
- LIMIT
- DISTINCT

### Aggregate Functions

- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()
- ROUND()

### Intermediate SQL

- GROUP BY
- HAVING
- CASE WHEN
- BETWEEN
- Subqueries

### Advanced SQL

- Common Table Expressions (CTEs)
- LAG()
- LEAD()
- RANK()
- DENSE_RANK()
- Window Functions
- Percentage Change Analysis
- Year-over-Year Analysis

---

## Key Analysis Performed

The project answers 50 analytical questions covering:

1. Total accident calculations
2. Total fatalities
3. Total injuries
4. Highest accident year
5. Highest fatality year
6. Highest injury year
7. Average annual accidents
8. Accident trends during 2010–2019
9. Fatality trends
10. Period-based comparisons
11. Above-average accident years
12. Above-average fatality years
13. Accident and fatality ratios
14. Percentage changes
15. Year-over-year changes
16. Ranking analysis
17. Moving averages
18. Trend categorization

---

## Key Findings

Based on the available dataset:

- Total recorded accidents across the selected years: **11,962,414**
- Total recorded fatalities: **2,965,001**
- Total recorded injuries: **12,121,774**
- Highest recorded accident count: **501,423 in 2015**
- Highest recorded fatality count: **151,417 in 2018**
- Highest recorded injury count: **527,512 in 2010**
- Average annual accident count: **412,497.03**
- Total accidents during 2010–2019: **4,826,604**
- Total fatalities during 2010–2019: **1,439,860**

---

## Database Setup

The project uses the following MySQL database:

```sql
CREATE DATABASE IF NOT EXISTS road_accident_project;

USE road_accident_project;
```

## How to Use This Project

1. Open MySQL Workbench.
2. Create or import the database and table.
3. Load the dataset into the `road_accidents` table.
4. Run the SQL queries from the project file.
5. Review the query results and insights.

### Project File

`Indian_Road_Accident_SQL_Analysis.sql`

Indian_Road_Accident_SQL_Analysis.sql

Dataset Limitations
The dataset contains selected yearly records rather than every calendar year between 1970 and 2019.
Therefore, LAG() and LEAD() compare the previous or next available record, not necessarily the immediately preceding or following calendar year.
Some road-length-related indicators for 2019 are unavailable in the source data and are represented as NULL.
Historical data may have differences in reporting methodology across periods.
Data Source

The core accident statistics are based on historical data reported by the Ministry of Road Transport & Highways (MoRTH), Government of India.

The dataset used in this project has been cleaned and structured into a SQL-friendly format for analytical purposes.

Project Outcome

This project demonstrates practical SQL skills by converting a real-world Indian dataset into a structured analytical workflow.

Workflow

Data → SQL Queries → Analysis → Insights

The project demonstrates the use of MySQL for:

Data aggregation
Filtering and sorting
Trend analysis
Statistical calculations
Subqueries
CTEs
Window functions
Ranking
Year-over-year analysis
Author

## Abhi Ranawat

SQL Data Analysis Portfolio Project
