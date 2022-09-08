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
/*SELECT release_date
FROM albums
WHERE id = 15;*/
/* c. The genre for the album Nevermind */
/*SELECT genre
FROM albums
WHERE name='nevermind';*/
/* d.Which albums were released in the 1990s*/
SELECT name
FROM albums
WHERE release_date >= '1990' and < '2000';