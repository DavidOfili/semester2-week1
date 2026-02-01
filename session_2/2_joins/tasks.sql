-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 social.db
-- 2. Load this script: .read tasks.sql
-- 3. Exit SQLite: .exit

1. SELECT content FROM posts WHERE deleted = 1;
2. SELECT username FROM users WHERE username LIKE 'a%';
3. SELECT u.username, p.content FROM posts AS p JOIN users AS u ON u.id = p.user_id WHERE p.content LIKE '%small%';
4. SELECT users.username, posts.content, posts.created_on FROM users JOIN posts ON users.id = posts.user_id WHERE posts.deleted = 0 ORDER BY posts.created_on ASC;
5. SELECT users.username, COUNT(posts.id) FROM users LEFT JOIN posts ON users.id = posts.user_id GROUP BY users.username ORDER BY COUNT(posts.id) DESC;
6. SELECT users.username, COUNT(posts.id) FROM users LEFT JOIN posts ON users.id = posts.user_id GROUP BY users.username HAVING COUNT(posts.id) > 3 ORDER BY COUNT(posts.id) DESC;
7. SELECT users.username, COUNT(follows.followed_user_id) FROM users LEFT JOIN follows ON users.id = follows.following_user_id GROUP BY users.username ORDER BY COUNT(follows.followed_user_id) DESC;
8. SELECT users.username, COUNT(follows.following_user_id) FROM users LEFT JOIN follows ON users.id = follows.followed_user_id GROUP BY users.username ORDER BY COUNT(follows.following_user_id) DESC LIMIT 5;
9. SELECT uf.username, ut.username FROM follows JOIN users AS uf ON uf.id = follows.following_user_id JOIN users AS ut ON ut.id = follows.followed_user_id ORDER BY uf.username, ut.username;
10. SELECT users.username, posts.content, posts.created_on FROM follows JOIN posts ON posts.user_id = follows.followed_user_id JOIN users ON users.id = posts.user_id WHERE follows.following_user_id = (SELECT id FROM users WHERE username = 'christopherprice') AND posts.deleted = 0 ORDER BY posts.created_on DESC;
