USE join_example_db;

SELECT *
FROM roles

SELECT u.name AS name, r.id as role
FROM users as u
JOIN roles as r
ON u.role_id = r.id
