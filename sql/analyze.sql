--Finding average happiness over years

SELECT year, AVG(happiness_score) AS average_happiness
FROM all_years
GROUP BY year
ORDER BY average_happiness DESC


--Finding correlation between various metrics and happiness score

SELECT
    CORR(happiness_score, gdp) AS corr_gdp,
    CORR(happiness_score, social_support) AS corr_support,
    CORR(happiness_score, freedom) AS corr_freedom,
    CORR(happiness_score, life_expectancy) AS corr_lifespan,
    CORR(happiness_score, generosity) AS corr_generosity,
    CORR(happiness_score, corruption) AS corr_corruption
FROM all_years

--Finding distribution of happiness score across various regions

SELECT region, AVG(happiness_score) AS average_happiness
FROM all_years
GROUP BY region
ORDER BY average_happiness DESC

--Finding 10 happiest countries on average

SELECT country, AVG(happiness_score) AS average_happiness
FROM all_years
GROUP BY country
ORDER BY average_happiness DESC
LIMIT 10

--Finding 10 unhappiest countries on average

SELECT country, AVG(happiness_score) AS average_happiness
FROM all_years
GROUP BY country
ORDER BY average_happiness ASC
LIMIT 10

--Finding 10 countries with biggest improvement in happiness score over years

SELECT whr_2015.country,
    (whr_2023.happiness_score - whr_2015.happiness_score) AS improvement
FROM whr_2015 
JOIN whr_2023 ON whr_2015.country = whr_2023.country
ORDER BY improvement DESC
LIMIT 10

--Finding 10 countries with biggest decrease in happiness score over years

SELECT whr_2015.country,
    (whr_2023.happiness_score - whr_2015.happiness_score) AS improvement
FROM whr_2015 
JOIN whr_2023 ON whr_2015.country = whr_2023.country
ORDER BY improvement ASC
LIMIT 10


WITH ranks AS (
    SELECT 
        country,
        year,
        happiness_score,
        RANK() OVER (PARTITION BY year ORDER BY happiness_score DESC) AS rank_position
    FROM all_years
)


SELECT * FROM ranks a JOIN ranks b on a.country = b.country 
ORDER BY a.year

SELECT 
    r2023.country,
    r2015.rank_position AS rank_2015,
    r2023.rank_position AS rank_2023,
    (r2015.rank_position - r2023.rank_position) AS rank_improvement
FROM ranks r2015
JOIN ranks r2023
      ON r2015.country = r2023.country
     AND r2015.year = 2015
     AND r2023.year = 2023
ORDER BY rank_improvement DESC
LIMIT 10;





SELECT 
    CASE 
        WHEN generosity >= 0.5 THEN 'High Generosity'
        WHEN generosity BETWEEN 0.25 AND 0.5 THEN 'Medium Generosity'
        ELSE 'Low Generosity'
    END AS Generosity_Level,
    AVG(happiness_score) AS Avg_Happiness,
    COUNT(*) AS Num_Countries
FROM all_years
GROUP BY Generosity_Level
ORDER BY Avg_Happiness DESC;

SELECT 
    region,
    AVG(Generosity) AS Avg_Generosity,
    AVG(happiness_score) AS Avg_Happiness
FROM happy_2016
GROUP BY region
ORDER BY Avg_Generosity DESC;



SELECT year, CORR(happiness_score, gdp) AS corr_gdp
FROM all_years
GROUP BY year
ORDER BY year 
