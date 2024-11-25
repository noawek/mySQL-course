/* SQL joins */

USE moviesdb;



/* INNER JOIN */

# INNER JOIN is the defult of JOIN (so saying JOIN is exactly the same as saying INNER JOIN)
# ON reffers to based on what are we joining the tables
# if there are columns with identical names in the tables we are joining and we want this column, we need to specify from what table we want it to be taken (as we did in movie_id)
SELECT movies.movie_id, title, budget, revenue, currency, unit FROM movies JOIN financials ON movies.movie_id=financials.movie_id; 
# the same as writing: 
SELECT movies.movie_id, title, budget, revenue, currency, unit FROM movies INNER JOIN financials ON movies.movie_id=financials.movie_id; 

# is you want to make it shorter and nicer:
SELECT m.movie_id, title, budget, revenue, currency, unit FROM movies m JOIN financials f ON m.movie_id=f.movie_id; 



# some experiments i did (joining and correcting the units and currencies, and rounding):
SELECT movies.movie_id, title, IF(currency="USD", budget*84, budget) as budget_inr, IF(currency="USD", revenue*84, revenue) as revenue_inr, unit FROM movies JOIN financials ON movies.movie_id=financials.movie_id; 
SELECT movies.movie_id, title, IF(currency="USD", budget_mln*84, budget_mln) as budget_inr_mln, IF(currency="USD", revenue_mln*84, revenue_mln) as revenue_inr_mln FROM (SELECT *, CASE 
WHEN unit="billions" THEN ROUND(budget*1000, 2)
WHEN unit="thousands" THEN ROUND(budget/1000, 2)
ELSE budget
END as budget_mln, CASE
WHEN unit="billions" THEN ROUND(revenue*1000, 2)
WHEN unit="thousands" THEN ROUND(revenue/1000, 2)
ELSE revenue
END as revenue_mln FROM financials) as calc JOIN movies ON movies.movie_id=calc.movie_id; 



/* OUTER JOINS */


/* LEFT JOIN */
# (can write it also as LEFT OUTER JOIN and it will still work)
# if i want to include data available in the table which is mentioned after FROM but not in the one after JOIN, 
# on top of their common data, and based on the column mentioned after ON
SELECT movies.movie_id, title, budget, revenue, currency, unit FROM movies LEFT JOIN financials ON movies.movie_id=financials.movie_id; 

/* RIGHT JOIN */
# (can write it also as RIGHT OUTER JOIN and it will still work)
# if i want to include data available in the table which is mentioned after JOIN but not in the one after FROM, 
# on top of their common data, and based on the column mentioned after ON
SELECT financials.movie_id, title, budget, revenue, currency, unit FROM movies RIGHT JOIN financials ON movies.movie_id=financials.movie_id; 
# had to change the source from which the data on column movie_id is taken from
# movies.movie_id --> financials.movie_id
# because we are preforming a right join and we want to include data about movies that don't appear on the movies table, but do appear in the financials with a movie_id

/* FULL JOIN = UNION */
# there is no commend to preform a FULL JOIN, that is why we are using UNION, that can unite our data
# if i want to include data available solely in the table which is mentioned after FROM and solely in the one after JOIN, 
# on top of their common data, and based on the column mentioned after ON
SELECT movies.movie_id, title, budget, revenue, currency, unit FROM movies LEFT JOIN financials ON movies.movie_id=financials.movie_id 
UNION 
SELECT financials.movie_id, title, budget, revenue, currency, unit FROM movies RIGHT JOIN financials ON movies.movie_id=financials.movie_id; 



/* USING clause */

# many time the column name which unify the tables can be different, and that is why we are using ON
# with ON we can mention the table the data is taken from and the column name where the data used for unifying appears

# but, somtimes, column names in both tables can be identical (just ike we saw with movies_id)
# in that case we can use USING ()
# with USING () we don't have to mention the table name as it is identical for them both

# we use the breckats () because somtimes we want to join tables based on TWO DIFFERENT COLUMNS!!
# also, with USING, we don't need to specify anything before using a column eith the same name in both tables
# it is smart enough to know which table we are reffering to

# example (INNER JOIN):
SELECT movie_id, title, budget, revenue, currency, unit FROM movies JOIN financials USING (movie_id); 

# or with a LEFT JOIN
SELECT movie_id, title, budget, revenue, currency, unit FROM movies LEFT JOIN financials USING (movie_id); 

# or with a RIGHT JOIN
SELECT movie_id, title, budget, revenue, currency, unit FROM movies RIGHT JOIN financials USING (movie_id); 

# or with a UNION
SELECT movie_id, title, budget, revenue, currency, unit FROM movies LEFT JOIN financials USING (movie_id) 
UNION 
SELECT movie_id, title, budget, revenue, currency, unit FROM movies RIGHT JOIN financials USING (movie_id); 



/* JOINING BASED ON 2 COLUMNS */

# either:
SELECT m.movie_id, title, budget, revenue, currency, unit FROM movies m JOIN financials f ON m.movie_id=f.movie_id AND /*written in the same way is another column i want to join base on her*/; 
# or:
SELECT movie_id, title, budget, revenue, currency, unit FROM movies JOIN financials USING (movie_id, /*another column i want to join base on her*/); 


