/* fifth exercise */
USE moviesdb;


/* 1. Show all the movies with their language names */
SELECT title, name FROM movies JOIN languages USING (language_id);

/* 2. Show all Telugu movie names (assuming you don't know the language id for Telugu) */
SELECT title FROM movies JOIN languages USING (language_id) WHERE name="telugu";

/* 3. Show the language and number of movies released in that language */
SELECT name, count(*) FROM movies JOIN languages USING (language_id) GROUP BY name;
# or better:
SELECT name, count(movie_id) as num_movies FROM movies RIGHT JOIN languages USING (language_id) GROUP BY name ORDER BY num_movies DESC;


