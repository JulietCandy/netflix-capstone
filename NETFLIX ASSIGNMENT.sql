CREATE TABLE netflix(
  show_id VARCHAR(10) PRIMARY KEY,
  type VARCHAR(20),
  title VARCHAR(255),
  director VARCHAR(255),
  country VARCHAR(100),
  date_added DATE,
  release_year INT,
  rating VARCHAR(20),
  duration VARCHAR(50),
  description TEXT
);

SELECT * FROM netflix;

---QUESTIONS WE WANT TO ASK
--1. Which countries makes the most top 10 Netflix contents? 
SELECT country, COUNT(*) AS total_titles
FROM netflix
WHERE country IS NOT NULL AND country != '' AND country != 'Not Given'
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

--2. Which movie directors made the most movies?
SELECT director, COUNT(DISTINCT title) AS movie_count
FROM netflix
WHERE type = 'Movie' AND director IS NOT NULL AND director != '' AND director != 'Unknown'
GROUP BY director
HAVING COUNT(DISTINCT title) > 5
ORDER BY director ASC;

--3. How many titles are there for each rating and content type?
SELECT type, rating, COUNT(*) AS total_titles
FROM netflix
WHERE rating IS NOT NULL AND rating != ''
GROUP BY type, rating 
HAVING COUNT(*) > 50
ORDER BY type, total_titles DESC;

--4. What are the list of shows made in the U.S that were released in 2020 or later?
SELECT title, release_year, rating
FROM netflix
WHERE type = 'TV Show' AND country = 'United States' AND release_year >= 2020
ORDER BY release_year ASC, title ASC;











