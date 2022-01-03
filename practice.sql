SELECT title, author, average_rating
FROM books
WHERE average_rating 
BETWEEN 3.5 AND 4.5;

SELECT DISTINCT author
FROM books;

SELECT id,
CASE
  WHEN home_points > away_points 
    THEN 'HOME WIN'
    ELSE 'AWAY WIN'
  END AS "WINNING TEAM"
FROM nba_matches;

SELECT genre, COUNT(id)
FROM apps
GROUP BY genre;

SELECT genre, SUM(reviews)
FROM apps
GROUP BY genre
HAVING SUM(reviews) > 30000000;

SELECT name, genre, rating
FROM apps
ORDER BY 3 DESC
LIMIT 20;

SELECT MIN(rating)
FROM apps;

SELECT MAX(rating)
FROM apps;

SELECT ROUND(AVG(rating),2) AS 'average rating'
FROM apps;

SELECT *
FROM projects
INNER JOIN employees
ON projects.employee_id = employees.id;

SELECT *
FROM projects
LEFT JOIN employees
ON projects.employee_id = employees.id;

SELECT *
FROM math_students
WHERE student_id IN (
  SELECT student_id
  FROM english_students
);


SELECT *
FROM math_students
WHERE grade IN (
  SELECT grade
  FROM math_students
  WHERE student_id = 7
);

SELECT *
FROM english_students
WHERE student_id NOT IN (
  SELECT student_id
  FROM math_students
);

SELECT grade
FROM math_students
WHERE EXISTS (
  SELECT grade
  FROM english_students
);

SELECT title, week, gross, 
  SUM(gross) OVER (
    PARTITION BY title 
    ORDER BY week
  ) AS 'running_total_gross'
FROM box_office;

SELECT id, product_id, (price * quantity) AS ' Units'
FROM orders;

SELECT date, (CAST(high AS 'REAL') + 
  CAST(low AS 'REAL')) / 2.0 AS 'average'
FROM weather;

SELECT purchase_id, DATE(purchase_date, '+7 days')
FROM purchases;

SELECT STRFTIME('%H', purchase_date)
FROM purchases;

SELECT STRFTIME('%m-%d', purchase_date) AS 'reformatted'
FROM purchases;
