/* HAVING clause, calculated columns */

USE moviesdb;



/* HAVING clause */

# how mySQL reads functions
FROM --> WHERE --> GROUP BY --> HAVING --> ORDER BY

# print all the years where more than 2 movies were released
SELECT release_year, count(*) as movies_count FROM movies GROUP BY release_year HAVING movies_count>2 ORDER BY movies_count DESC; # can't use where!!



/* calculated columns/derived columns */

# how to find the current date (of today):
SELECT CURDATE();
# how to find the current year (using the date of today):
SELECT YEAR(CURDATE()); # the YEAR function knows to extract the year variable from any given date

# calculate actor age
SELECT *, YEAR(CURDATE())-birth_year as age FROM actors; 

# calculate profit per moovie (financials table):
SELECT *, (revenue-budget) as profit FROM financials; 



/* IF function */

# convert USD to INR:
SELECT DISTINCT currency FROM financials; # only USD and INR
# 1 USD = 84 INR
SELECT *, IF(currency="USD", revenue*84, revenue) as revenue_INR FROM financials; 



/* CASE statement */

# convert billions/thousands to millions USING A CASE STATEMENT:
SELECT DISTINCT unit FROM financials; # only billions millions and thousands
# 1 billion = 1000 millions (revenue*1000)
# 1 thousand = 0.001 millions (revenue/1000)
SELECT *, CASE 
WHEN unit="billions" THEN revenue*1000 
WHEN unit="thousands" THEN revenue/1000 
ELSE revenue
END as revenue_mln FROM financials;



### convert billions/thousands to millions + USD to INR using a CASE STATEMENT:
SELECT DISTINCT unit FROM financials; # only billions millions and thousands
# 1 billion = 1000 millions (revenue*1000)
# 1 thousand = 0.001 millions (revenue/1000)
SELECT *, CASE 
WHEN unit="billions" AND currency="USD" THEN revenue*1000*84 
WHEN unit="billions" AND currency="INR" THEN revenue*1000
WHEN unit="thousands" AND currency="USD" THEN revenue/1000*84
WHEN unit="thousands" AND currency="INR" THEN revenue/1000
WHEN unit="millions" AND currency="USD" THEN revenue*84
ELSE revenue
END as revenue_mln FROM financials;

#### maybe there is another way:
SELECT *, CASE 
WHEN unit="billions" THEN revenue_INR*1000 
WHEN unit="thousands" THEN revenue_INR/1000 
ELSE revenue_INR
END as revenue_mln_INR FROM (SELECT *, IF(currency="USD", revenue*84, revenue) as revenue_INR FROM financials) as calc; 
# or:
SELECT *, CASE 
WHEN unit="billions" THEN revenue_INR*1000 
WHEN unit="thousands" THEN revenue_INR/1000 
ELSE revenue_INR
END as revenue_mln_INR FROM (SELECT *, CASE
WHEN currency="USD" THEN revenue*84
ELSE revenue
END as revenue_INR FROM financials) as calc; 


##### maybe there is another way:
SELECT DISTINCT unit FROM financials; # only billions millions and thousands
# 1 billion = 1000 millions (revenue*1000)
# 1 thousand = 0.001 millions (revenue/1000)
SELECT *, CASE 
WHEN currency="USD" THEN revenue*84 
WHEN unit="billions" THEN revenue*1000
WHEN unit="thousands" THEN revenue/1000
ELSE revenue
END as revenue_mln FROM financials;


