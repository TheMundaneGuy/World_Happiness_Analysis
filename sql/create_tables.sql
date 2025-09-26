--Create table to import data from for year 2015

CREATE TABLE whr_2015(
    country varchar(50),
    region varchar(100),
    happiness_score float,
    gdp float,
    social_support float,
    life_expectancy float,
    freedom float,
    generosity float,
    corruption float
);

COPY whr_2015(country,region,happiness_score, gdp, social_support, life_expectancy, freedom, generosity, corruption) 
    FROM 'C:\Projects\Postgres\csv\WHR_2015.csv' DELIMITER ',' CSV HEADER; 

--Copy table structure and import data for all years

CREATE TABLE whr_2016 AS TABLE whr_2015 WITH NO DATA;

COPY whr_2016(country,region,happiness_score, gdp, social_support, life_expectancy, freedom, generosity, corruption) 
    FROM 'C:\Projects\Postgres\csv\WHR_2016.csv' DELIMITER ',' CSV HEADER; 

CREATE TABLE whr_2017 AS TABLE whr_2015 WITH NO DATA;

COPY whr_2017(country,region,happiness_score, gdp, social_support, life_expectancy, freedom, generosity, corruption) 
    FROM 'C:\Projects\Postgres\csv\WHR_2017.csv' DELIMITER ',' CSV HEADER; 


CREATE TABLE whr_2018 AS TABLE whr_2015 WITH NO DATA;

COPY whr_2018(country,region,happiness_score, gdp, social_support, life_expectancy, freedom, generosity, corruption) 
    FROM 'C:\Projects\Postgres\csv\WHR_2018.csv' DELIMITER ',' CSV HEADER; 


CREATE TABLE whr_2019 AS TABLE whr_2015 WITH NO DATA;

COPY whr_2019(country,region,happiness_score, gdp, social_support, life_expectancy, freedom, generosity, corruption) 
    FROM 'C:\Projects\Postgres\csv\WHR_2019.csv' DELIMITER ',' CSV HEADER; 


CREATE TABLE whr_2020 AS TABLE whr_2015 WITH NO DATA;

COPY whr_2020(country,region,happiness_score, gdp, social_support, life_expectancy, freedom, generosity, corruption) 
    FROM 'C:\Projects\Postgres\csv\WHR_2020.csv' DELIMITER ',' CSV HEADER; 


CREATE TABLE whr_2021 AS TABLE whr_2015 WITH NO DATA;

COPY whr_2021(country,region,happiness_score, gdp, social_support, life_expectancy, freedom, generosity, corruption) 
    FROM 'C:\Projects\Postgres\csv\WHR_2021.csv' DELIMITER ',' CSV HEADER; 


CREATE TABLE whr_2022 AS TABLE whr_2015 WITH NO DATA;

COPY whr_2022(country,region,happiness_score, gdp, social_support, life_expectancy, freedom, generosity, corruption) 
    FROM 'C:\Projects\Postgres\csv\WHR_2022.csv' DELIMITER ',' CSV HEADER; 


CREATE TABLE whr_2023 AS TABLE whr_2015 WITH NO DATA;

COPY whr_2023(country,region,happiness_score, gdp, social_support, life_expectancy, freedom, generosity, corruption) 
    FROM 'C:\Projects\Postgres\csv\WHR_2023.csv' DELIMITER ',' CSV HEADER; 


--Create a new table with metrics from all years

CREATE TABLE all_years AS
SELECT *, 2015 AS year FROM whr_2015
UNION ALL
SELECT *, 2016 AS year FROM whr_2016
UNION ALL
SELECT *, 2017 AS year FROM whr_2017
UNION ALL
SELECT *, 2018 AS year FROM whr_2018
UNION ALL
SELECT *, 2019 AS year FROM whr_2019
UNION ALL
SELECT *, 2020 AS year FROM whr_2020
UNION ALL
SELECT *, 2021 AS year FROM whr_2021
UNION ALL
SELECT *, 2022 AS year FROM whr_2022
UNION ALL
SELECT *, 2023 AS year FROM whr_2023;
