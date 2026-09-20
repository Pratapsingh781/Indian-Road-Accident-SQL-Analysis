-- ============================================================
--                  SQL DATA ANALYSIS PROJECT
-- ============================================================
--
-- PROJECT TITLE:
-- Indian Road Accident Analysis
--
-- DATABASE:
-- road_accident_project
--
-- TABLE:
-- road_accidents
--
-- DATASET PERIOD:
-- 1970 - 2019
--
-- AVAILABLE RECORDS:
-- 29 selected years
--
-- ============================================================
-- PROJECT OBJECTIVE
-- ============================================================
--
-- The objective of this project is to analyze historical
-- road safety data in India using MySQL.
--
-- The analysis focuses on:
-- • Total accidents
-- • Persons killed
-- • Persons injured
-- • Population
-- • Registered vehicles
-- • Road length
-- • Accident rates
-- • Fatality rates
-- • Injury rates
-- • Year-over-year changes
-- • Long-term trends
-- • Rankings and comparisons
--
-- ============================================================
-- SQL SKILLS USED
-- ============================================================
--
-- Basic SQL:
-- SELECT
-- WHERE
-- ORDER BY
-- LIMIT
-- DISTINCT
-- BETWEEN
--
-- Aggregate Functions:
-- COUNT()
-- SUM()
-- AVG()
-- MAX()
-- MIN()
-- ROUND()
--
-- Intermediate SQL:
-- GROUP BY
-- HAVING
-- CASE WHEN
-- Calculated Columns
-- Percentage Calculations
--
-- Advanced SQL:
-- Subqueries
-- Common Table Expressions (CTEs)
-- LAG()
-- LEAD()
-- RANK()
-- DENSE_RANK()
-- Window Functions
-- Running Totals
-- Moving Averages
-- Year-over-Year Analysis
-- Percentage Change
--
-- ============================================================
-- PROJECT STRUCTURE
-- ============================================================
--
-- Q1 - Q10:
-- Basic Data Analysis
--
-- Q11 - Q20:
-- Aggregation and Filtering
--
-- Q21 - Q30:
-- CASE WHEN, Subqueries and Calculated Metrics
--
-- Q31 - Q40:
-- CTEs and Trend Analysis
--
-- Q41 - Q50:
-- Window Functions and Advanced Analysis
--
-- ============================================================
-- DATASET OVERVIEW
-- ============================================================
--
-- Main Columns:
--
-- year
-- total_accidents
-- persons_killed
-- persons_injured
-- population_thousands
-- registered_vehicles_thousands
-- road_length_km
--
-- Rate / Ratio Columns:
--
-- accidents_per_lakh_population
-- accidents_per_10000_vehicles
-- accidents_per_10000_km_roads
-- killed_per_lakh_population
-- killed_per_10000_vehicles
-- killed_per_10000_km_roads
-- injured_per_lakh_population
-- injured_per_10000_vehicles
-- injured_per_10000_km_roads
--
-- ============================================================
-- DATASET LIMITATIONS
-- ============================================================
--
-- 1. The dataset contains selected years between 1970 and 2019,
--    not every calendar year.
--
-- 2. Therefore, comparisons using LAG() or LEAD() represent
--    the previous or next AVAILABLE record, not necessarily
--    the immediately previous or next calendar year.
--
-- 3. Decade-level analysis represents only the years available
--    in this dataset.
--
-- 4. Some road-length-based metrics contain NULL values for
--    2019 because the source data does not provide those values.
--
-- 5. Missing values have not been artificially replaced with
--    estimated values.
--
-- 6. The dataset has been cleaned and converted into a
--    MySQL-ready format for analysis.
--
-- ============================================================
-- DATA SOURCE
-- ============================================================
--
-- Source Organization:
-- Ministry of Road Transport & Highways (MoRTH)
-- Government of India
--
-- Source Publication:
-- Road Accidents in India
--
-- The Ministry of Road Transport & Highways publishes
-- official statistics covering accidents, fatalities and
-- injuries in India.
--
-- The 2019 official report records:
-- Total Accidents  : 449,002
-- Persons Killed   : 151,113
-- Persons Injured  : 451,361
--
-- ============================================================
-- KEY PROJECT FINDINGS
-- ============================================================
--
-- Total Recorded Accidents:
-- 11,962,414
--
-- Total Persons Killed:
-- 2,965,001
--
-- Total Persons Injured:
-- 12,121,774
--
-- Highest Accident Count:
-- 2015 -> 501,423
--
-- Highest Fatality Count:
-- 2018 -> 151,417
--
-- Highest Injury Count:
-- 2010 -> 527,512
--
-- Lowest Accident Count:
-- 1970 -> 114,100
--
-- Average Annual Accident Count:
-- 412,497.03
--
-- Highest Accidents per Lakh Population:
-- 2007 -> 42.4641
--
-- Largest Increase Between Available Records:
-- 1990 -> +129,400 compared with 1980
--
-- Largest Decrease Between Available Records:
-- 2016 -> -20,771 compared with 2015
--
-- ============================================================
-- ANALYTICAL TAKEAWAYS
-- ============================================================
--
-- • Historical data can be used to identify long-term trends.
--
-- • Absolute counts and population-based rates provide
--   different perspectives on the dataset.
--
-- • Window functions help analyze changes between records.
--
-- • LAG() and LEAD() can be used for year-over-year style
--   comparisons between available records.
--
-- • CTEs make complex analytical queries easier to structure.
--
-- • Ranking functions help identify records with the highest
--   or lowest values for selected metrics.
--
-- • Moving averages help smooth short-term fluctuations
--   and highlight broader trends.
--
-- • Percentage calculations help compare the relative
--   contribution of individual years.
--
-- ============================================================
-- DATABASE SETUP
-- ============================================================

CREATE DATABASE IF NOT EXISTS road_accident_project;

USE road_accident_project;

-- ============================================================
-- TABLE:
-- road_accidents
-- ============================================================
--
-- The complete table structure and dataset are provided
-- in the SQL import section below.
--
-- ============================================================
--                  END OF PROJECT OVERVIEW
-- ============================================================

-- ============================================================
-- Q1. What was the total number of road accidents recorded
-- between 1970 and 2019?
-- ============================================================

SELECT SUM(total_accidents) AS total_road_accidents
FROM road_accidents;

-- Answer:
-- 11,962,414 total road accidents

-- Insight:
-- Nearly 12 million road accidents were recorded across
-- the years included in this dataset.


-- ============================================================
-- Q2. Which year recorded the highest number of road accidents?
-- ============================================================

SELECT year, total_accidents
FROM road_accidents
ORDER BY total_accidents DESC
LIMIT 1;

-- Answer:
-- 2015 recorded the highest number of road accidents: 501,423.

-- Insight:
-- 2015 had the highest accident count in the dataset.


-- ============================================================
-- Q3. Which year recorded the highest number of persons killed?
-- ============================================================

SELECT year, persons_killed
FROM road_accidents
ORDER BY persons_killed DESC
LIMIT 1;

-- Answer:
-- 2018 recorded the highest number of persons killed: 151,417.

-- Insight:
-- The highest number of fatalities occurred in 2018,
-- while the highest accident count occurred in 2015.


-- ============================================================
-- Q4. Which year recorded the highest number of persons injured?
-- ============================================================

SELECT year, persons_injured
FROM road_accidents
ORDER BY persons_injured DESC
LIMIT 1;

-- Answer:
-- 2010 recorded the highest number of persons injured: 527,512.

-- Insight:
-- 2010 had the highest number of recorded injuries
-- among the years included in the dataset.


-- ============================================================
-- Q5. Which year recorded the lowest number of road accidents?
-- ============================================================

SELECT year, total_accidents
FROM road_accidents
ORDER BY total_accidents ASC
LIMIT 1;

-- Answer:
-- 1970 recorded the lowest number of road accidents: 114,100.

-- Insight:
-- 1970 had the lowest accident count among the
-- years included in the dataset.


-- ============================================================
-- Q6. What was the total number of persons killed
-- between 1970 and 2019?
-- ============================================================

SELECT SUM(persons_killed) AS total_persons_killed
FROM road_accidents;

-- Answer:
-- 2,965,001 persons were killed.

-- Insight:
-- The dataset records nearly 3 million road-accident
-- fatalities across the included years.


-- ============================================================
-- Q7. What was the total number of persons injured
-- between 1970 and 2019?
-- ============================================================

SELECT SUM(persons_injured) AS total_persons_injured
FROM road_accidents;

-- Answer:
-- 12,121,774 persons were injured.

-- Insight:
-- The recorded number of injuries was substantially higher
-- than the number of fatalities during the period.


-- ============================================================
-- Q8. What was the average number of road accidents per year?
-- ============================================================

SELECT ROUND(AVG(total_accidents), 2) AS average_annual_accidents
FROM road_accidents;

-- Answer:
-- 412,497.03 average accidents per included year.

-- Insight:
-- On average, around 412,497 accidents were recorded
-- for each year represented in the dataset.


-- ============================================================
-- Q9. Which year had the highest accidents per lakh population?
-- ============================================================

SELECT year, accidents_per_lakh_population
FROM road_accidents
ORDER BY accidents_per_lakh_population DESC
LIMIT 1;

-- Answer:
-- 2007 had the highest accident rate:
-- 42.4641 accidents per lakh population.

-- Insight:
-- 2007 had the highest accident rate relative to population,
-- even though it did not have the highest absolute accident count.


-- ============================================================
-- Q10. What was the total number of road accidents
-- recorded between 2010 and 2019?
-- ============================================================

SELECT SUM(total_accidents) AS total_accidents_2010_2019
FROM road_accidents
WHERE year BETWEEN 2010 AND 2019;

-- Answer:
-- 4,826,604 road accidents.

-- Insight:
-- More than 4.8 million...


-- ============================================================
-- Q11. What was the average number of persons killed per year?
-- ============================================================

SELECT ROUND(AVG(persons_killed), 2) AS average_persons_killed
FROM road_accidents;

-- Answer:
-- The average number of persons killed per included year was
-- 102,241.41.

-- Insight:
-- On average, more than 102,000 fatalities were recorded
-- for each year represented in the dataset.



-- ============================================================
-- Q12. What was the average number of persons injured per year?
-- ============================================================

SELECT ROUND(AVG(persons_injured), 2) AS average_persons_injured
FROM road_accidents;

-- Answer:
-- The average number of persons injured per included year was
-- 417,992.21.

-- Insight:
-- The annual average number of injuries was significantly
-- higher than the annual average number of fatalities.



-- ============================================================
-- Q13. How many years recorded more accidents than the
-- overall average annual accidents?
-- ============================================================

SELECT COUNT(*) AS years_above_average
FROM road_accidents
WHERE total_accidents > (
    SELECT AVG(total_accidents)
    FROM road_accidents
);

-- Answer:
-- 16 included years recorded more accidents than the
-- overall average annual accident count.

-- Insight:
-- More than half of the included years were below the
-- overall average, while 16 years exceeded it.



-- ============================================================
-- Q14. How many years recorded more than 400,000
-- road accidents?
-- ============================================================

SELECT COUNT(*) AS years_above_400k_accidents
FROM road_accidents
WHERE total_accidents > 400000;

-- Answer:
-- 16 included years recorded more than 400,000 accidents.

-- Insight:
-- Accident counts crossed the 400,000 level frequently,
-- particularly during the 2000s and 2010s.



-- ============================================================
-- Q15. What was the total number of road accidents
-- recorded between 2000 and 2009?
-- ============================================================

SELECT SUM(total_accidents) AS total_accidents_2000_2009
FROM road_accidents
WHERE year BETWEEN 2000 AND 2009;

-- Answer:
-- 4,391,698 road accidents were recorded between 2000 and 2009.

-- Insight:
-- The 2000–2009 period accounted for more than 4.39 million
-- recorded road accidents in the included dataset.



-- ============================================================
-- Q16. What was the total number of persons killed
-- between 2000 and 2009?
-- ============================================================

SELECT SUM(persons_killed) AS total_killed_2000_2009
FROM road_accidents
WHERE year BETWEEN 2000 AND 2009;

-- Answer:
-- 983,770 persons were killed between 2000 and 2009.

-- Insight:
-- Nearly one million fatalities were recorded during
-- the 2000–2009 period.



-- ============================================================
-- Q17. What was the average number of accidents per year
-- between 2000 and 2009?
-- ============================================================

SELECT ROUND(AVG(total_accidents), 2) AS average_accidents_2000_2009
FROM road_accidents
WHERE year BETWEEN 2000 AND 2009;

-- Answer:
-- The average was 439,169.80 accidents per included year.

-- Insight:
-- The average annual accident count during 2000–2009
-- was higher than the overall dataset average.



-- ============================================================
-- Q18. Which years recorded more than 500,000 road accidents?
-- ============================================================

SELECT year, total_accidents
FROM road_accidents
WHERE total_accidents > 500000
ORDER BY total_accidents DESC;

-- Answer:
-- 2015 recorded more than 500,000 accidents:
-- 501,423.

-- Insight:
-- 2015 was the only included year in the dataset
-- to cross the 500,000 accident mark.



-- ============================================================
-- Q19. Which years recorded more than 150,000 persons killed?
-- ============================================================

SELECT year, persons_killed
FROM road_accidents
WHERE persons_killed > 150000
ORDER BY persons_killed DESC;

-- Answer:
-- 2018: 151,417
-- 2019: 151,113
-- 2016: 150,785

-- Insight:
-- Three included years crossed the 150,000 fatalities
-- threshold, all occurring after 2015.



-- ============================================================
-- Q20. What was the total number of accidents for each
-- decade represented in the dataset?
-- ============================================================

SELECT
    FLOOR(year / 10) * 10 AS decade,
    SUM(total_accidents) AS total_accidents
FROM road_accidents
GROUP BY FLOOR(year / 10) * 10
ORDER BY decade;

-- Answer:
-- 1970s: 114,100
-- 1980s: 153,200
-- 1990s: 2,476,812
-- 2000s: 4,391,698
-- 2010s: 4,826,604

-- Insight:
-- The dataset shows substantially higher recorded accident
-- totals in the 2000s and 2010s than in earlier periods.
--
-- IMPORTANT:
-- The source dataset contains selected years rather than
-- every calendar year, so these decade totals represent
-- only the years available in this dataset.

-- Answer:
-- 4,826,604 road accidents.

-- Insight:
-- More than 4.8 million road accidents were recorded
-- during the 2010–2019 period represented in this dataset.


-- ============================================================
-- Q21. Classify each year based on the number of accidents:
-- Below 300,000 = Low
-- 300,000 to 449,999 = Medium
-- 450,000 or more = High
-- ============================================================

SELECT
    year,
    total_accidents,
    CASE
        WHEN total_accidents < 300000 THEN 'Low'
        WHEN total_accidents < 450000 THEN 'Medium'
        ELSE 'High'
    END AS accident_category
FROM road_accidents
ORDER BY year;

-- Answer:
-- Low: 3 years
-- Medium: 13 years
-- High: 13 years

-- Insight:
-- The dataset contains a substantial number of years
-- in the High category based on the defined threshold.



-- ============================================================
-- Q22. How many years had more fatalities than the
-- overall average number of fatalities?
-- ============================================================

SELECT COUNT(*) AS years_above_average_fatalities
FROM road_accidents
WHERE persons_killed > (
    SELECT AVG(persons_killed)
    FROM road_accidents
);

-- Answer:
-- 14 included years had fatalities above the overall average.

-- Insight:
-- The later years contribute heavily to the number of years
-- exceeding the overall average fatality level.



-- ============================================================
-- Q23. How many years had more injuries than the
-- overall average number of injuries?
-- ============================================================

SELECT COUNT(*) AS years_above_average_injuries
FROM road_accidents
WHERE persons_injured > (
    SELECT AVG(persons_injured)
    FROM road_accidents
);

-- Answer:
-- 17 included years had injuries above the overall average.

-- Insight:
-- More than half of the included years exceeded the
-- overall average injury count.



-- ============================================================
-- Q24. What was the difference in accident counts between
-- 1970 and 2019?
-- ============================================================

SELECT
    MAX(total_accidents) - MIN(total_accidents) AS accident_difference
FROM road_accidents
WHERE year IN (1970, 2019);

-- Answer:
-- The difference was 334,902.

-- Insight:
-- The accident count in 2019 was substantially higher
-- than the count recorded in 1970.



-- ============================================================
-- Q25. What was the percentage increase in accident count
-- from 1970 to 2019?
-- ============================================================

SELECT
    ROUND(
        (
            (SELECT total_accidents
             FROM road_accidents
             WHERE year = 2019)
            -
            (SELECT total_accidents
             FROM road_accidents
             WHERE year = 1970)
        )
        /
        (SELECT total_accidents
         FROM road_accidents
         WHERE year = 1970) * 100,
        2
    ) AS percentage_increase;

-- Answer:
-- The accident count increased by 293.52%.

-- Insight:
-- The recorded accident count in 2019 was almost four times
-- the level recorded in 1970.



-- ============================================================
-- Q26. Which year had the highest fatalities as a percentage
-- of total accidents?
-- ============================================================

SELECT
    year,
    total_accidents,
    persons_killed,
    ROUND((persons_killed / total_accidents) * 100, 2)
        AS fatalities_per_100_accidents
FROM road_accidents
ORDER BY fatalities_per_100_accidents DESC
LIMIT 1;

-- Answer:
-- 2019 had the highest ratio:
-- 33.66 fatalities per 100 accidents.

-- Insight:
-- The fatality-to-accident ratio was highest in 2019
-- among the years included in the dataset.



-- ============================================================
-- Q27. Which year had the highest number of injuries
-- as a percentage of total accidents?
-- ============================================================

SELECT
    year,
    total_accidents,
    persons_injured,
    ROUND((persons_injured / total_accidents) * 100, 2)
        AS injuries_per_100_accidents
FROM road_accidents
ORDER BY injuries_per_100_accidents DESC
LIMIT 1;

-- Answer:
-- 2004 had the highest ratio:
-- 108.05 injuries per 100 accidents.

-- Insight:
-- In 2004, the number of recorded injuries was slightly
-- more than the number of recorded accidents.



-- ============================================================
-- Q28. Which decades had more than 4 million total accidents?
-- ============================================================

SELECT
    FLOOR(year / 10) * 10 AS decade,
    SUM(total_accidents) AS total_accidents
FROM road_accidents
GROUP BY FLOOR(year / 10) * 10
HAVING SUM(total_accidents) > 4000000
ORDER BY total_accidents DESC;

-- Answer:
-- 2010s: 4,826,604
-- 2000s: 4,391,698

-- Insight:
-- The 2000s and 2010s each crossed the 4 million mark
-- based on the years available in the dataset.



-- ============================================================
-- Q29. Which year had the second-highest number of accidents?
-- ============================================================

SELECT
    year,
    total_accidents
FROM road_accidents
WHERE total_accidents = (
    SELECT MAX(total_accidents)
    FROM road_accidents
    WHERE total_accidents < (
        SELECT MAX(total_accidents)
        FROM road_accidents
    )
);

-- Answer:
-- 2010 had the second-highest count: 499,628.

-- Insight:
-- 2010 was just below the highest recorded count,
-- which occurred in 2015.



-- ============================================================
-- Q30. Which year had the second-highest number of fatalities?
-- ============================================================

SELECT
    year,
    persons_killed
FROM road_accidents
WHERE persons_killed = (
    SELECT MAX(persons_killed)
    FROM road_accidents
    WHERE persons_killed < (
        SELECT MAX(persons_killed)
        FROM road_accidents
    )
);

-- Answer:
-- 2019 had the second-highest number of fatalities: 151,113.

-- Insight:
-- 2019 was only slightly below the highest fatality count,
-- which was recorded in 2018.


-- ============================================================
-- Q31. Show each year along with the previous available year's
-- accident count.
-- ============================================================

SELECT
    year,
    total_accidents,
    LAG(total_accidents) OVER (ORDER BY year) AS previous_accidents
FROM road_accidents
ORDER BY year;

-- Answer:
-- The first available year (1970) has NULL as there is
-- no previous record in the dataset.
--
-- Example:
-- 2009 = 486,384
-- Previous available year (2008) = 484,704

-- Insight:
-- LAG() allows us to compare each year's value with the
-- previous available record.



-- ============================================================
-- Q32. Calculate the change in accident count compared with
-- the previous available year.
-- ============================================================

SELECT
    year,
    total_accidents,
    LAG(total_accidents) OVER (ORDER BY year) AS previous_accidents,
    total_accidents -
        LAG(total_accidents) OVER (ORDER BY year)
        AS accident_change
FROM road_accidents
ORDER BY year;

-- Answer:
-- Example:
-- 2015 = 501,423
-- 2014 = 489,400
-- Change = 12,023

-- Insight:
-- This calculation identifies whether the count increased
-- or decreased compared with the previous available record.



-- ============================================================
-- Q33. Calculate the percentage change in accident count
-- compared with the previous available year.
-- ============================================================

SELECT
    year,
    total_accidents,
    ROUND(
        (
            total_accidents -
            LAG(total_accidents) OVER (ORDER BY year)
        )
        /
        LAG(total_accidents) OVER (ORDER BY year) * 100,
        2
    ) AS percentage_change
FROM road_accidents
ORDER BY year;

-- Answer:
-- The largest percentage increase between consecutive
-- available records occurred in 1990: 84.46%.

-- Insight:
-- 1990 showed the largest percentage increase compared
-- with the previous available record (1980).



-- ============================================================
-- Q34. Which available year had the largest increase in
-- accident count compared with the previous available year?
-- ============================================================

WITH yearly_change AS (
    SELECT
        year,
        total_accidents,
        total_accidents -
            LAG(total_accidents) OVER (ORDER BY year)
            AS accident_change
    FROM road_accidents
)
SELECT
    year,
    total_accidents,
    accident_change
FROM yearly_change
WHERE accident_change IS NOT NULL
ORDER BY accident_change DESC
LIMIT 1;

-- Answer:
-- 1990 had the largest increase:
-- 129,400 compared with 1980.

-- Insight:
-- The largest absolute increase between two available
-- records occurred from 1980 to 1990.



-- ============================================================
-- Q35. Which available year had the largest decrease in
-- accident count compared with the previous available year?
-- ============================================================

WITH yearly_change AS (
    SELECT
        year,
        total_accidents,
        total_accidents -
            LAG(total_accidents) OVER (ORDER BY year)
            AS accident_change
    FROM road_accidents
)
SELECT
    year,
    total_accidents,
    accident_change
FROM yearly_change
WHERE accident_change IS NOT NULL
ORDER BY accident_change ASC
LIMIT 1;

-- Answer:
-- 2016 had the largest decrease:
-- -20,771 compared with 2015.

-- Insight:
-- The largest decline occurred between 2015 and 2016.



-- ============================================================
-- Q36. Show each year along with the previous available
-- fatality count.
-- ============================================================

SELECT
    year,
    persons_killed,
    LAG(persons_killed) OVER (ORDER BY year)
        AS previous_fatalities
FROM road_accidents
ORDER BY year;

-- Answer:
-- The first available year (1970) has NULL because
-- there is no previous record.

-- Insight:
-- LAG() can be applied to different measures to study
-- year-to-year changes.



-- ============================================================
-- Q37. Which available year had the largest increase in
-- fatalities compared with the previous available year?
-- ============================================================

WITH fatality_change AS (
    SELECT
        year,
        persons_killed,
        persons_killed -
            LAG(persons_killed) OVER (ORDER BY year)
            AS fatality_change
    FROM road_accidents
)
SELECT
    year,
    persons_killed,
    fatality_change
FROM fatality_change
WHERE fatality_change IS NOT NULL
ORDER BY fatality_change DESC
LIMIT 1;

-- Answer:
-- 2011 had the largest increase:
-- 7,972 compared with 2010.

-- Insight:
-- The largest absolute increase in fatalities occurred
-- between 2010 and 2011.



-- ============================================================
-- Q38. Which available year had the largest decrease in
-- fatalities compared with the previous available year?
-- ============================================================

WITH fatality_change AS (
    SELECT
        year,
        persons_killed,
        persons_killed -
            LAG(persons_killed) OVER (ORDER BY year)
            AS fatality_change
    FROM road_accidents
)
SELECT
    year,
    persons_killed,
    fatality_change
FROM fatality_change
WHERE fatality_change IS NOT NULL
ORDER BY fatality_change ASC
LIMIT 1;

-- Answer:
-- 2012 had the largest decrease:
-- -4,227 compared with 2011.

-- Insight:
-- The largest decline in fatalities occurred between
-- 2011 and 2012.



-- ============================================================
-- Q39. Show each year with the next available year's
-- accident count.
-- ============================================================

SELECT
    year,
    total_accidents,
    LEAD(total_accidents) OVER (ORDER BY year)
        AS next_available_accidents
FROM road_accidents
ORDER BY year;

-- Answer:
-- The final available year (2019) has NULL because
-- there is no next record.

-- Insight:
-- LEAD() allows comparison with the next available record,
-- which is useful for forward-looking trend analysis.



-- ============================================================
-- Q40. Identify whether the accident count increased,
-- decreased, or remained the same compared with the
-- previous available year.
-- ============================================================

WITH yearly_change AS (
    SELECT
        year,
        total_accidents,
        LAG(total_accidents) OVER (ORDER BY year)
            AS previous_accidents
    FROM road_accidents
)
SELECT
    year,
    total_accidents,
    previous_accidents,
    CASE
        WHEN previous_accidents IS NULL THEN 'No Previous Record'
        WHEN total_accidents > previous_accidents THEN 'Increased'
        WHEN total_accidents < previous_accidents THEN 'Decreased'
        ELSE 'No Change'
    END AS trend
FROM yearly_change
ORDER BY year;

-- Answer:
-- The query classifies every available year as:
-- Increased, Decreased, or No Change.

-- Insight:
-- This creates a simple trend indicator that can later
-- be used for dashboard analysis and reporting.


-- ============================================================
-- Q41. Rank all years based on total accident count.
-- ============================================================

SELECT
    year,
    total_accidents,
    RANK() OVER (ORDER BY total_accidents DESC) AS accident_rank
FROM road_accidents
ORDER BY accident_rank;

-- Answer:
-- Rank 1  = 2015 → 501,423
-- Rank 2  = 2010 → 499,628
-- Rank 3  = 2011 → 497,686

-- Insight:
-- 2015 had the highest recorded accident count,
-- followed by 2010 and 2011.



-- ============================================================
-- Q42. Display the top 5 years based on total accident count.
-- ============================================================

WITH ranked_years AS (
    SELECT
        year,
        total_accidents,
        RANK() OVER (ORDER BY total_accidents DESC) AS accident_rank
    FROM road_accidents
)
SELECT
    year,
    total_accidents,
    accident_rank
FROM ranked_years
WHERE accident_rank <= 5
ORDER BY accident_rank;

-- Answer:
-- 1. 2015 → 501,423
-- 2. 2010 → 499,628
-- 3. 2011 → 497,686
-- 4. 2012 → 490,383
-- 5. 2014 → 489,400

-- Insight:
-- The highest five recorded values were concentrated
-- in the 2010s.



-- ============================================================
-- Q43. Rank all years based on persons killed using
-- DENSE_RANK().
-- ============================================================

SELECT
    year,
    persons_killed,
    DENSE_RANK() OVER (ORDER BY persons_killed DESC)
        AS fatality_rank
FROM road_accidents
ORDER BY fatality_rank;

-- Answer:
-- Rank 1 = 2018 → 151,417
-- Rank 2 = 2019 → 151,113
-- Rank 3 = 2016 → 150,785

-- Insight:
-- The highest three fatality counts occurred in
-- 2018, 2019 and 2016.



-- ============================================================
-- Q44. Calculate the cumulative total of accidents
-- from the earliest available year to each year.
-- ============================================================

SELECT
    year,
    total_accidents,
    SUM(total_accidents) OVER (
        ORDER BY year
        ROWS UNBOUNDED PRECEDING
    ) AS cumulative_accidents
FROM road_accidents
ORDER BY year;

-- Answer:
-- The cumulative total by 2019 was 11,962,414.

-- Insight:
-- The running total shows how the overall recorded count
-- accumulated across the available years.



-- ============================================================
-- Q45. What was the cumulative total of accidents
-- up to the year 2000?
-- ============================================================

SELECT
    SUM(total_accidents) AS cumulative_accidents_to_2000
FROM road_accidents
WHERE year <= 2000;

-- Answer:
-- 3,592,294

-- Insight:
-- More than 3.59 million recorded accidents were accumulated
-- through the year 2000 in the available dataset.



-- ============================================================
-- Q46. Calculate the 3-record moving average of
-- total accidents.
-- ============================================================

SELECT
    year,
    total_accidents,
    ROUND(
        AVG(total_accidents) OVER (
            ORDER BY year
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS three_record_moving_average
FROM road_accidents
ORDER BY year;

-- Answer:
-- For 2019, the 3-record moving average was 460,318.67.

-- Calculation:
-- Last 3 available records:
-- 2017 = 464,910
-- 2018 = 467,044
-- 2019 = 449,002
-- Average = 460,318.67

-- Insight:
-- The moving average smooths short-term fluctuations
-- and makes the broader trend easier to analyze.



-- ============================================================
-- Q47. What percentage of the total recorded accidents
-- came from each year?
-- ============================================================

SELECT
    year,
    total_accidents,
    ROUND(
        total_accidents /
        SUM(total_accidents) OVER () * 100,
        2
    ) AS percentage_of_total
FROM road_accidents
ORDER BY percentage_of_total DESC;

-- Answer:
-- 2015 contributed the largest share: 4.19%.

-- Insight:
-- No single year contributed a very large portion
-- of the complete period total.



-- ============================================================
-- Q48. Which year contributed the largest percentage
-- of the overall total?
-- ============================================================

WITH yearly_share AS (
    SELECT
        year,
        total_accidents,
        total_accidents /
        SUM(total_accidents) OVER () * 100 AS percentage_of_total
    FROM road_accidents
)
SELECT
    year,
    total_accidents,
    ROUND(percentage_of_total, 2) AS percentage_of_total
FROM yearly_share
ORDER BY percentage_of_total DESC
LIMIT 1;

-- Answer:
-- 2015 contributed the largest share: 4.19%.

-- Insight:
-- 2015 had the largest individual contribution
-- to the total recorded count.



-- ============================================================
-- Q49. Compare each year's accident count with the
-- overall average and calculate the difference.
-- ============================================================

SELECT
    year,
    total_accidents,
    ROUND(AVG(total_accidents) OVER (), 2)
        AS overall_average,
    ROUND(
        total_accidents -
        AVG(total_accidents) OVER (),
        2
    ) AS difference_from_average
FROM road_accidents
ORDER BY difference_from_average DESC;

-- Answer:
-- 2015 had the largest positive difference from the
-- overall average:
-- 501,423 - 412,497.03 = 88,925.97

-- Insight:
-- 2015 was approximately 88,926 above the overall
-- average annual count.



-- ============================================================
-- Q50. Create a final performance category for every year
-- based on its rank:
--
-- Rank 1–5   = Top 5
-- Rank 6–15  = Upper Middle
-- Rank 16–25 = Lower Middle
-- Rank 26+   = Bottom
-- ============================================================

WITH ranked_years AS (
    SELECT
        year,
        total_accidents,
        RANK() OVER (ORDER BY total_accidents DESC)
            AS accident_rank
    FROM road_accidents
)
SELECT
    year,
    total_accidents,
    accident_rank,
    CASE
        WHEN accident_rank <= 5 THEN 'Top 5'
        WHEN accident_rank <= 15 THEN 'Upper Middle'
        WHEN accident_rank <= 25 THEN 'Lower Middle'
        ELSE 'Bottom'
    END AS performance_category
FROM ranked_years
ORDER BY accident_rank;

-- Answer:
-- Each available year is classified into one of four
-- categories according to its ranking.

-- Insight:
-- This creates a simple analytical segmentation that can
-- be useful when presenting the dataset in a portfolio
-- dashboard or interview.

-- ============================================================
--                    PROJECT SUMMARY
-- ============================================================


-- ============================================================
--                    KEY PROJECT FINDINGS
-- ============================================================

-- 1. Total Recorded Accidents:
--    11,962,414

-- 2. Total Persons Killed:
--    2,965,001

-- 3. Total Persons Injured:
--    12,121,774

-- 4. Highest Accident Count:
--    2015 -> 501,423

-- 5. Highest Fatality Count:
--    2018 -> 151,417

-- 6. Highest Injury Count:
--    2010 -> 527,512

-- 7. Lowest Accident Count:
--    1970 -> 114,100

-- 8. Average Annual Accident Count:
--    412,497.03

-- 9. Highest Accidents per Lakh Population:
--    2007 -> 42.4641

-- 10. Largest Increase Between Available Records:
--     1990 -> +129,400 compared with 1980

-- 11. Largest Decrease Between Available Records:
--     2016 -> -20,771 compared with 2015

-- 12. Highest Fatality-to-Accident Ratio:
--     2019 -> 33.66%

-- 13. Highest Injury-to-Accident Ratio:
--     2004 -> 108.05%

-- ============================================================
--                  ANALYTICAL TAKEAWAYS
-- ============================================================

-- • Historical data shows substantial changes in accident,
--   fatality and injury counts over the available period.

-- • Accident counts reached their highest recorded level
--   in 2015 at 501,423.

-- • Fatalities reached their highest recorded level
--   in 2018 at 151,417.

-- • Injuries reached their highest recorded level
--   in 2010 at 527,512.

-- • Absolute accident counts and population-based rates
--   provide different perspectives for analysis.

-- • LAG() and LEAD() help compare the current record
--   with previous and next available records.

-- • RANK() and DENSE_RANK() help identify records with
--   the highest or lowest values.

-- • CTEs make complex analytical calculations easier
--   to organize and understand.

-- • Moving averages help identify broader trends by
--   reducing short-term fluctuations.

-- • Percentage calculations help measure the relative
--   contribution of individual years.

-- ============================================================
--                    DATASET LIMITATIONS
-- ============================================================

-- 1. The dataset contains selected years between
--    1970 and 2019, not every calendar year.

-- 2. Therefore, LAG() and LEAD() comparisons represent
--    the previous or next AVAILABLE record rather than
--    necessarily the immediately previous or next
--    calendar year.

-- 3. Decade-level calculations represent only the years
--    available in the dataset.

-- 4. Some road-length-based metrics contain NULL values
--    for 2019 because the source data does not provide
--    those values.

-- 5. Missing values have not been artificially replaced
--    with estimated values.

-- 6. The dataset has been cleaned and converted into a
--    MySQL-ready format for analytical purposes.

-- ============================================================
--                     DATA SOURCE NOTE
-- ============================================================

-- Source Organization:
-- Ministry of Road Transport & Highways (MoRTH)
-- Government of India

-- Source Publication:
-- Road Accidents in India

-- The Ministry of Road Transport & Highways publishes
-- annual statistics covering accidents, fatalities and
-- injuries in India.

-- Official 2019 figures:
-- Total Accidents : 449,002
-- Persons Killed  : 151,113
-- Persons Injured : 451,361

-- ============================================================
--                   PROJECT OUTCOME
-- ============================================================

-- This project demonstrates the use of MySQL for
-- real-world data analysis.

-- Key analytical skills demonstrated:
--
-- • Data Filtering
-- • Sorting
-- • Aggregation
-- • Grouping
-- • Conditional Logic
-- • Calculated Metrics
-- • Subqueries
-- • CTEs
-- • Window Functions
-- • Ranking
-- • Trend Analysis
-- • Year-over-Year Comparison
-- • Percentage Analysis
-- • Moving Averages
--
-- The analysis converts raw historical data into
-- meaningful analytical insights using SQL.

-- ============================================================
--                    END OF PROJECT
-- ============================================================