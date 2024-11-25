/* BASICS */

/* (SELECT, WHERE, DISTINCT, LIKE, Order By) */


SELECT * FROM moviesdb.movies; /* extracting a certain table from a certain database */

USE moviesdb; /* want to use a certain defult database to extract tables */
SELECT * FROM movies; /* choosing the table to show from the database in USE (defult) */

SELECT industry, title FROM movies; /* choosing certain columns from a table */

SELECT * FROM movies WHERE industry="bollywood"; /* want to see rows where in the industry column there is a specific string */
SELECT count(*) FROM movies WHERE industry="bollywood"; /* want to count how many rows where in the industry column there is a specific string */

SELECT distinct industry FROM movies; /* want to see the uniqe strings i have in a certain column */
SELECT count(distinct industry) FROM movies;  /* want to count how many uniqe strings i have in a certain column */

SELECT * FROM movies WHERE title LIKE "%thor%"; /* finding strings in a certain column that contains somewhere the string i put between %% (i don't care what comes before or after) */
SELECT * FROM movies WHERE title LIKE "thor%";  /* finding strings in a certain column that starts with the string i put before the % (i don't care what comes after this string) */

SELECT * FROM movies WHERE studio="";  /* finding null places in a certain column and present data on them */
SELECT count(*) FROM movies WHERE studio="";  /* counting null places in a certain column */

SELECT * FROM movies WHERE imdb_rating>=9;  /* finding values greater than and/or equal to a certain value in a certain column and present data on them */
SELECT * FROM movies WHERE imdb_rating>9;  /* finding values greater than a certain value in a certain column and present data on them */
SELECT * FROM movies WHERE imdb_rating=9;  /* finding values equal to a certain value in a certain column and present data on them */
SELECT * FROM movies WHERE imdb_rating<=5;  /* finding values smaller than  a certain value in a certain column and present data on them */

/* finding values between certain values in a certain column and present data on them */
SELECT * FROM movies WHERE imdb_rating>=6 AND imdb_rating<=8; 
/* or */
SELECT * FROM movies WHERE imdb_rating BETWEEN 6 AND 8; 
/* don't want to include the outline values that between yhem we find values in a certain column and present data on them */
SELECT * FROM movies WHERE imdb_rating>6 AND imdb_rating<8; 

/* finding specific values in a certain column and present data on them */
SELECT * FROM movies WHERE release_year=2022 OR release_year=2019 OR release_year=2018; 
/* or */
SELECT * FROM movies WHERE release_year IN (2022,2019,2018); 
/* can use on text as well */
SELECT * FROM movies WHERE studio IN ("marvel studios", "zee studios"); 

/* numeric NULL/NOT NULL */
SELECT * FROM movies WHERE imdb_rating is NULL;  /* finding null places in a certain column with numeric values and present data on them */
SELECT * FROM movies WHERE imdb_rating is NOT NULL;  /* finding all places in a certain column with numeric values that has a value, and present data on them */

/* order */
SELECT * FROM movies WHERE industry="bollywood" order by imdb_rating; /* the defult is an ascending order ASC */
SELECT * FROM movies WHERE industry="bollywood" order by imdb_rating DESC; /* changing the defult to a descending order DESC */

/* limit - top X/bottom X */
SELECT * FROM movies WHERE industry="bollywood" order by imdb_rating LIMIT 5; /* CHECKING BOTTOM 5 (the defult is an ascending order ASC) */
SELECT * FROM movies WHERE industry="bollywood" order by imdb_rating DESC LIMIT 5; /* CHECKING TOP 5 AFTER changing the defult to a descending order DESC */
/* remember - index starts FROM ZERO!! */
SELECT * FROM movies WHERE industry="hollywood" order by imdb_rating DESC LIMIT 5 OFFSET 1; /* CHECKING TOP 5 without the first one (starting from the 2nd best, WITHOUT INDEX ZERO) AFTER changing the defult to a descending order DESC */



