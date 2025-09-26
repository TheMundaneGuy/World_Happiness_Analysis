# 🌍 World Happiness Report (2015–2020) – SQL Data Analysis  

## 📌 Project Overview  
This project analyzes the **World Happiness Report dataset (2015–2023)** using **SQL**.  
The dataset contains information about countries’ happiness scores along with key factors like GDP per capita, social support, health, freedom, generosity, and corruption.  

The goal of this project is to demonstrate **advanced SQL data analysis techniques** including:  
- Data cleaning & handling missing values  
- Combining multiple yearly datasets  
- Window functions (ranking, lag, moving averages)  
- Statistical analysis (correlation, variance, outlier detection)  
- Business-style insights  

---

## 📂 Dataset  
- **Tables**: `2015`, `2016`, `2017`, `2018`, `2019`, `2020`, `2021`, `2022`, `2023`    
- **Columns** (common across years):  
  - `country`  
  - `region`   
  - `happiness_score`  
  - `gdp`  
  - `social_support`  
  - `life_expectancy`  
  - `freedom`  
  - `generosity`  
  - `corruption`  

---

## ⚙️ Data Cleaning Steps  
1. **Combine tables** into a single dataset `all_years` with a `year` column:  
   ```sql
   CREATE TABLE all_years AS
   SELECT *, 2015 AS year FROM [2015]
   UNION ALL
   SELECT *, 2016 AS year FROM [2016]
   UNION ALL
   SELECT *, 2017 AS year FROM [2017]
   UNION ALL
   SELECT *, 2018 AS year FROM [2018]
   UNION ALL
   SELECT *, 2019 AS year FROM [2019]
   UNION ALL
   SELECT *, 2020 AS year FROM [2020];
   ```
