/* fourth exercise */
USE moviesdb;

/* 1. Print profit % for all the movies */
SELECT *, round(((revenue-budget)/budget*100),2) as profit_precentage FROM financials;
