/* Summary Analytics */

/* (MIN, MAX, AVG, Group By) */

USE moviesdb;

/* MIN, MAX, AVG */
/* finding MAX value in column for a certain catagory in a different column */
SELECT MAX(imdb_rating) FROM movies WHERE industry="bollywood";
/* finding MIN value in column for a certain catagory in a different column */
SELECT MIN(imdb_rating) FROM movies WHERE industry="bollywood";
/* finding AVG value in column for a certain catagory in a different column */
SELECT AVG(imdb_rating) FROM movies WHERE studio="marvel studios";

/* showing nicely! */
/* if i want less numbers after the decimal point */
SELECT ROUND(AVG(imdb_rating),2) FROM movies WHERE studio="marvel studios"; /* 2 numbers after the decimal point */
/* defining a costume column header insted of it being so long! */
SELECT ROUND(AVG(imdb_rating),2) as avg_rating FROM movies WHERE studio="marvel studios"; 
/* creating a whole table of results with special headers */
SELECT ROUND(MIN(imdb_rating),2) as min_rating, ROUND(MAX(imdb_rating),2) as max_rating, ROUND(AVG(imdb_rating),2) as avg_rating FROM movies WHERE studio="marvel studios"; 

/* Group By */
SELECT industry, count(*) FROM movies GROUP BY industry; /* showing the number of movies for each industry in one table */
/* showing nicely! */
SELECT industry, count(*) as cnt FROM movies GROUP BY industry; /* adding a name to the column showing the number of movies for each industry in one table */
SELECT studio, count(*) as cnt FROM movies GROUP BY studio ORDER BY cnt; /* ordering the different studios according to the number of moviea they have after adding a name to the column showing the number of movies for each industry in one table */
SELECT studio, count(*) as cnt FROM movies GROUP BY studio ORDER BY cnt DESC; /* DESCENDING ORDER OF the different studios according to the number of moviea they have after adding a name to the column showing the number of movies for each industry in one table */
/* creating a whole table of results with special headers */
SELECT industry, count(*) as cnt, AVG(imdb_rating) as avg_rating FROM movies GROUP BY industry; 
SELECT industry, count(*) as cnt, ROUND(AVG(imdb_rating),1) as avg_rating FROM movies GROUP BY industry; /* with rounding of the numbers after the decimal point */ 
SELECT studio, count(*) as cnt, ROUND(AVG(imdb_rating),1) as avg_rating FROM movies GROUP BY studio; /* another example */ 
SELECT studio, count(*) as cnt, ROUND(AVG(imdb_rating),1) as avg_rating FROM movies GROUP BY studio ORDER BY avg_rating DESC; /* order by avarage rating DESC*/ 
/* skipping blanks */
SELECT studio, count(*) as cnt, ROUND(AVG(imdb_rating),1) as avg_rating FROM movies WHERE studio!="" GROUP BY studio ORDER BY avg_rating DESC; /* order by avarage rating DESC*/ 



/* FUNCTION FOR STANDART DEVIATION */
STDDEV()  

