--Checking NULL Values

SELECT * FROM all_years
WHERE country IS NULL
OR region IS NULL
OR happiness_score IS NULL
OR social_support IS NULL
OR life_expectancy IS NULL
OR freedom IS NULL
OR generosity IS NULL
OR corruption IS NULL

--Checking and correcting errors in region and country names over years

SELECT region, COUNT(region) FROM all_years
GROUP BY region

SELECT country, COUNT(country) AS num_country 
FROM all_years
GROUP BY country
HAVING COUNT(country)<9
ORDER BY num_country

UPDATE all_years SET country = 'Somaliland Region'
WHERE country = 'Somaliland region'

UPDATE all_years SET country = 'Turkey'
WHERE country = 'Turkiye'
