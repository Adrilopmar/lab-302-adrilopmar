CREATE SCHEMA lab302;

CREATE TABLE author (
  author_id INT PRIMARY KEY AUTO_INCREMENT,
  author_name VARCHAR(255) NOT NULL
);

CREATE TABLE title (
  title_id INT PRIMARY KEY AUTO_INCREMENT,
  author_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  word_count INT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE views (
  views_id INT PRIMARY KEY AUTO_INCREMENT,
  title_id INT NOT NULL,
  views INT NOT NULL,
  FOREIGN KEY (title_id) REFERENCES title(title_id)
);