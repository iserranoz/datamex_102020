SELECT titleauthor.au_id as 'AUTHOR ID',
authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', titles.title as 'TITLE', 
publishers.pub_name as 'PUBLICATIONS'
FROM titleauthor 
LEFT JOIN authors ON titleauthor.au_id = authors.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id;

/*----------------------------------*/

SELECT titleauthor.au_id as 'AUTHOR ID',
authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', COUNT(titles.title) as 'TITLE COUNT', 
publishers.pub_name as 'PUBLICATIONS'
FROM titleauthor 
LEFT JOIN authors ON titleauthor.au_id = authors.au_id 
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
group by titleauthor.au_id
order by COUNT(titles.title) DESC;

/*----------------------------------*/


SELECT SUM(sales.qty) AS 'UNITS SOLDS', titleauthor.au_id, authors.au_fname, authors.au_lname FROM sales 
LEFT JOIN titleauthor ON sales.title_id = titleauthor.title_id
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
GROUP BY titleauthor.au_id
ORDER BY SUM(sales.qty) DESC;

/*----------------------------------*/


SELECT SUM(sales.qty) AS 'UNITS SOLDS', titleauthor.au_id, authors.au_fname, authors.au_lname FROM sales 
LEFT JOIN titleauthor ON sales.title_id = titleauthor.title_id
LEFT JOIN authors ON titleauthor.au_id = authors.au_id
GROUP BY titleauthor.au_id
ORDER BY SUM(sales.qty) DESC;


/*----------------------------------*/



CREATE TEMPORARY TABLE temp_table3(
SELECT authors.au_id, authors.au_fname, authors.au_lname, titleauthor.title_id, titles.title, SUM(titles.price*
sales.qty*titles.royalty/100*titleauthor.royaltyper / 100) AS 'PROFIT'
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id);

SELECT au_id,au_lname,au_fname,SUM(PROFIT) AS'TOTAL' FROM temp_table3
GROUP BY au_id
ORDER BY SUM(PROFIT) DESC ;