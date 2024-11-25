/* first exercise */
USE moviesdb;

/* 1. Print all movie titles and release year for all Marvel Studios movies */
SELECT title, release_year FROM movies WHERE studio="marvel studios";

/* 2. Print all movies that have Avenger in their name */
SELECT * FROM movies WHERE title LIKE "%avenger%";

/* 3. Print the year when the movie "The Godfather" was released */
SELECT release_year FROM movies WHERE title="the godfather";

/* 4. Print all distinct movie studios in the Bollywood industry */
SELECT distinct studio FROM movies WHERE industry="bollywood";

