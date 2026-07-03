-- Day 5: Sorting, Limit, Offset, and Pagination

-- Add more sample users
INSERT INTO users (full_name, email, password_hash, phone)
VALUES
('Akhil Reddy', 'akhil@gmail.com', 'hashed_password_6', '9000011111'),
('Meera Nair', 'meera@gmail.com', 'hashed_password_7', '9000022222'),
('Vikram Singh', 'vikram@yahoo.com', 'hashed_password_8', '9000033333'),
('Priya Patel', 'priya@hotmail.com', 'hashed_password_9', '9000044444'),
('John Smith', 'john@gmail.com', 'hashed_password_10', '9000055555');

-- 1. Sort users by newest first
SELECT id, full_name, email, created_at
FROM users
ORDER BY created_at DESC;

-- 2. Sort users A to Z
SELECT id, full_name, email
FROM users
ORDER BY full_name ASC;

-- 3. Show top 5 users
SELECT id, full_name, email
FROM users
ORDER BY id ASC
LIMIT 5;

-- 4. Sort properties price low to high
SELECT id, title, price, city
FROM properties
ORDER BY price ASC;

-- 5. Sort properties price high to low
SELECT id, title, price, city
FROM properties
ORDER BY price DESC;

-- 6. Top 3 expensive properties
SELECT id, title, price, city
FROM properties
ORDER BY price DESC
LIMIT 3;

-- 7. Cheapest 3 properties
SELECT id, title, price, city
FROM properties
ORDER BY price ASC
LIMIT 3;

-- 8. Pagination page 1
SELECT id, title, price, city
FROM properties
ORDER BY id ASC
LIMIT 3 OFFSET 0;

-- 9. Pagination page 2
SELECT id, title, price, city
FROM properties
ORDER BY id ASC
LIMIT 3 OFFSET 3;

-- 10. Available properties with pagination
SELECT id, title, price, city, status
FROM properties
WHERE status = 'AVAILABLE'
ORDER BY created_at DESC
LIMIT 5 OFFSET 0;

-- 11. Real search API style query
SELECT id, title, price, city, bedrooms, property_type, status
FROM properties
WHERE city = 'London'
AND status = 'AVAILABLE'
ORDER BY price DESC
LIMIT 5 OFFSET 0;

-- 12. Count total available properties
SELECT COUNT(*) AS total_available_properties
FROM properties
WHERE status = 'AVAILABLE';