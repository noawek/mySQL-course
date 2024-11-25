/* second exercise */
USE moviesdb;

/* 1. Print all movies in the order of their release year (latest first) */
SELECT * FROM movies order by release_year DESC;

/* 2. All movies released in the year 2022 */
SELECT * FROM movies WHERE release_year=2022;

/* 3. Now all the movies released after 2020 */
SELECT * FROM movies WHERE release_year>2020;

/* 4. All movies after the year 2020 that have more than 8 rating */
SELECT * FROM movies WHERE release_year>2020 AND imdb_rating>8;

/* 5. Select all movies that are by Marvel studios and Hombale Films */
SELECT * FROM movies WHERE studio IN ("marvel studios", "hombale films");

/* 6. Select all THOR movies by their release year */
SELECT * FROM movies WHERE title LIKE "%thor%" order by release_year;

/* 7. Select all movies that are not from Marvel Studios */
SELECT * FROM movies WHERE studio NOT IN ("marvel studios");
/* or */ 
SELECT * FROM movies WHERE studio!="marvel studios";


