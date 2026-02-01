-- Enable readable output format
.mode columns
.headers on

-- Instructions for students:
-- 1. Open SQLite in terminal: sqlite3 social.db
-- 2. Load this script: .read example.sql
-- 3. Exit SQLite: .exit

-- Use this file to test things out, follow allow with classwork, etc.

SELECT 
    username, 
    content
FROM 
    users 
JOIN posts ON users.id = posts.user_id;