CREATE TABLE articles (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  content TEXT,
  FULLTEXT KEY (title, content)
);

INSERT INTO articles (title, content)
VALUES ('The Quick Brown Fox Jumps Over the Lazy Dog', 'This is a sample article about a quick brown fox.'),
       ('Fuzzy Search in MariaDB', 'Learn how to implement fuzzy search using full-text search in MariaDB.'),
       ('SQL Basics', 'This article covers the basics of SQL, including SELECT, FROM, WHERE, and more.');

SELECT *
FROM articles
WHERE MATCH(title, content) AGAINST ('quick brown fox' IN NATURAL LANGUAGE MODE);


SELECT *	
FROM articles
WHERE MATCH(title, content) AGAINST ('+quick +brown -dog' IN BOOLEAN MODE);
