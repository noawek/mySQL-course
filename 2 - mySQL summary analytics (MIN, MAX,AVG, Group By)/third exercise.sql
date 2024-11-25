/* third exercise */
USE moviesdb;

/* 1. How many movies were released between 2015 and 2022 */
SELECT count(*) as cnt FROM movies WHERE release_year BETWEEN 2015 AND 2022;

/* 2. Print the max and min movie release year */
SELECT MAX(release_year) as MAX_release_year, MIN(release_year) as MIN_release_year FROM movies;

/* 3. Print a year and how many movies were released in that year starting with the latest year */
SELECT release_year, count(*) as cnt FROM movies GROUP BY release_year ORDER BY release_year DESC;
