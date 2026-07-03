-- Day 7: Weekly Review and Practice

-- 1. Check available tables
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';


-- 2. View users safely without password_hash
SELECT id, full_name, email, phone, is_active, created_at
FROM users
ORDER BY id ASC;


-- 3. View properties
SELECT id, title, price, city, property_type, status, is_featured, created_at
FROM properties
ORDER BY id ASC;


-- 4. Insert more users
INSERT INTO users (full_name, email, password_hash, phone)
VALUES
('Arjun Mehta', 'arjun.mehta@gmail.com', 'hashed_password_11', '9000000011'),
('Divya Rao', 'divya.rao@gmail.com', 'hashed_password_12', '9000000012'),
('Rohit Verma', 'rohit.verma@yahoo.com', 'hashed_password_13', '9000000013'),
('Sneha Kapoor', 'sneha.kapoor@hotmail.com', 'hashed_password_14', '9000000014'),
('Naveen Kumar', 'naveen.kumar@gmail.com', 'hashed_password_15', '9000000015');


-- 5. Insert more properties
INSERT INTO properties 
(title, description, price, city, address, bedrooms, bathrooms, area_sqft, property_type, status, is_featured)
VALUES
('Modern Villa in London', 'A beautiful villa with garden and private parking.', 950000.00, 'London', 'Richmond, London', 5, 4, 4000, 'Villa', 'AVAILABLE', TRUE),

('Affordable Flat in Leeds', 'Budget friendly apartment near transport links.', 180000.00, 'Leeds', 'City Centre, Leeds', 2, 1, 750, 'Apartment', 'AVAILABLE', FALSE),

('Luxury House in Manchester', 'Premium house with modern interiors.', 620000.00, 'Manchester', 'Didsbury, Manchester', 4, 3, 2300, 'House', 'AVAILABLE', TRUE),

('Studio Home in Birmingham', 'Compact studio suitable for students.', 135000.00, 'Birmingham', 'City Centre, Birmingham', 1, 1, 480, 'Studio', 'AVAILABLE', FALSE),

('Family Villa in Bristol', 'Spacious villa suitable for large families.', 700000.00, 'Bristol', 'Clifton, Bristol', 4, 3, 2800, 'Villa', 'BOOKED', TRUE),

('Simple House in London', 'Good house in a peaceful area.', 520000.00, 'London', 'Croydon, London', 3, 2, 1500, 'House', 'SOLD', FALSE),

('Premium Apartment in London', 'High-end apartment with city view.', 480000.00, 'London', 'Canary Wharf, London', 2, 2, 1100, 'Apartment', 'AVAILABLE', TRUE),

('Budget Studio in Manchester', 'Small studio near university area.', 125000.00, 'Manchester', 'Oxford Road, Manchester', 1, 1, 420, 'Studio', 'AVAILABLE', FALSE);


-- 6. CRUD practice

-- Create
INSERT INTO users (full_name, email, password_hash, phone)
VALUES ('Test User', 'test.user@gmail.com', 'hashed_password_test', '9000099999');

-- Read
SELECT id, full_name, email, phone, is_active
FROM users
WHERE email = 'test.user@gmail.com';

-- Update
UPDATE users
SET phone = '9111199999'
WHERE email = 'test.user@gmail.com';

-- Delete
DELETE FROM users
WHERE email = 'test.user@gmail.com';


-- 7. Filtering practice

-- Available properties
SELECT id, title, price, city, status
FROM properties
WHERE status = 'AVAILABLE';

-- London properties
SELECT id, title, price, city
FROM properties
WHERE city = 'London';

-- Properties below 500000
SELECT id, title, price, city
FROM properties
WHERE price < 500000;

-- Available London properties
SELECT id, title, price, city, status
FROM properties
WHERE city = 'London'
AND status = 'AVAILABLE';

-- Houses or villas
SELECT id, title, property_type, price, city
FROM properties
WHERE property_type IN ('House', 'Villa');

-- Search title containing villa
SELECT id, title, price, city
FROM properties
WHERE title ILIKE '%villa%';


-- 8. Sorting and pagination

-- Price low to high
SELECT id, title, price, city
FROM properties
ORDER BY price ASC;

-- Price high to low
SELECT id, title, price, city
FROM properties
ORDER BY price DESC;

-- Latest properties first
SELECT id, title, price, city, created_at
FROM properties
ORDER BY created_at DESC;

-- Page 1
SELECT id, title, price, city
FROM properties
ORDER BY id ASC
LIMIT 5 OFFSET 0;

-- Page 2
SELECT id, title, price, city
FROM properties
ORDER BY id ASC
LIMIT 5 OFFSET 5;


-- 9. Real backend search query
SELECT id, title, price, city, bedrooms, bathrooms, property_type, status
FROM properties
WHERE city = 'London'
AND price BETWEEN 200000 AND 900000
AND property_type IN ('Apartment', 'House')
AND status = 'AVAILABLE'
ORDER BY price DESC
LIMIT 5 OFFSET 0;


-- 10. Count for pagination
SELECT COUNT(*) AS total_matching_properties
FROM properties
WHERE city = 'London'
AND price BETWEEN 200000 AND 900000
AND property_type IN ('Apartment', 'House')
AND status = 'AVAILABLE';


-- NOTE:
-- Run these invalid constraint tests separately.
-- They are expected to fail.

-- Invalid price test
-- INSERT INTO properties (title, price, city, property_type, status)
-- VALUES ('Invalid Price Property', -1000.00, 'London', 'Apartment', 'AVAILABLE');

-- Invalid status test
-- INSERT INTO properties (title, price, city, property_type, status)
-- VALUES ('Invalid Status Property', 250000.00, 'London', 'Apartment', 'PENDING');

-- Duplicate email test
-- INSERT INTO users (full_name, email, password_hash, phone)
-- VALUES ('Duplicate User', 'prasanna@gmail.com', 'hashed_password_duplicate', '9000000000');