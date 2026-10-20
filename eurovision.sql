SELECT Count(country)
FROM eurovision_winners
WHERE country IS "Israel";


SELECT Count(country)
FROM eurovision_winners
WHERE country = host_country;

SELECT year
FROM eurovision_winners
WHERE country IS "Israel";

Select song_length_seconds
From song_details
ORDER BY song_length_seconds ASC
Limit 1;

SELECT *
FROM eurovision_winners e
JOIN song_details s ON s.year = e.year;

SELECT e.song_name, e.year
FROM eurovision_winners e
JOIN song_details s ON e.year = s.year
WHERE s.solo_performance = TRUE;

SELECT count(language)
FROM song_details
WHERE language = "English";

SELECT ROUND(AVG(song_length_seconds), 2) AS avg_length
FROM song_details;

SELECT year
FROM eurovision_winners
WHERE song_name = "Hallelujah";

SELECT year,  solo_performance
FROM song_details
WHERE solo_performance = FALSE
ORDER BY year
LIMIT 1;

SELECT e.song_name, max(s.song_length_seconds) AS longest_song
FROM eurovision_winners e
JOIN song_details s ON s.year = e.year
ORDER BY s.song_length_seconds DESC
LIMIT 1;

SELECT country, COUNT(*) AS wins
FROM eurovision_winners
GROUP BY country
ORDER BY wins DESC
LIMIT 1;

SELECT year, country, count(country) AS wins
FROM eurovision_winners
GROUP BY country
ORDER BY wins DESC;

SELECT e.song_name, e.winner, s.language
FROM eurovision_winners e
JOIN song_details s ON e.year = s.year
WHERE language LIKE "French";

SELECT country, MIN(year) AS first_win, MAX(year) AS last_win
FROM eurovision_winners
WHERE country IS "Israel";

SELECT e.song_name, e.country, e.year, s.song_length_seconds
FROM eurovision_winners e
JOIN song_details s ON e.year = s.year
ORDER BY s.song_length_seconds DESC;

SELECT e.song_name, e.country, ROUND(AVG(s.song_length_seconds), 2) AS avg_length
FROM eurovision_winners e
JOIN song_details s ON s.year = e.year
GROUP BY e.country
HAVING s.song_length_seconds > avg_length
ORDER BY avg_length DESC;

SELECT e.song_name, e.winner, s.song_length_seconds
FROM song_details s
JOIN eurovision_winners e
WHERE s.solo_performance IS TRUE
ORDER BY s.song_length_seconds ASC
LIMIT 1;

SELECT e.country, ROUND(AVG(s.song_length_seconds), 2) AS avg_length
FROM eurovision_winners e
JOIN song_details s ON s.year = e.year
GROUP BY country
ORDER BY avg_length DESC;

SELECT COUNT(language) AS lang_count
FROM song_details
WHERE language IS NOT "English";

SELECT COUNT(DISTINCT(genre)) AS genre_count
FROM song_details;

SELECT year, winner, song_name
FROM eurovision_winners
WHERE country IS "Israel"
ORDER BY year DESC
LIMIT 1;
