USE albums_db;
SELECT * FROM albums ORDER BY release_date;
/* xplore the structure of the albums table.

a. How many rows are in the albums table?
31 rows
b. How many unique artist names are in the albums table?
SELECT count( DISTINCT artist)FROM albums;
23
c. What is the primary key for the albums table?
id
d. What is the oldest release date for any album in the albums table? What is the most recent release date?
SELECT * FROM albums ORDER BY release_date;
1967 earliest, 2011 latest
*/
/* Write queries to find the following information:
a. The name. of all albums by pink floyd 
SELECT *
FROM albums
WHERE artist = 'Pink Floyd'; 
/* b. The year Sgt. Pepper's Lonely Hearts Club Band was released*/
/*SELECT *
FROM albums
WHERE release_date = (SELECT min(release_date) FROM albums)
/* c. The genre for the album Nevermind */
/*SELECT genre
FROM albums
WHERE name='nevermind';*/
/* d.Which albums were released in the 1990s*/
/*
SELECT name
FROM albums
WHERE release_date > 1989 AND release_date < 2000;
*/
/* e. Which albums had less than 20 million certified sales */
/* SELECT name
FROM albums
WHERE sales < 20;/*
/* f. All the albums with a genre of "Rock". 
Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?*/
/*SELECT name
FROM albums
WHERE genre LIKE '%Rock%';
*/
