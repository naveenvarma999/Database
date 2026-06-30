-- Day 3: CRUD Operations

-- CREATE: Insert new user
INSERT INTO users (full_name, email, password_hash, phone)
VALUES ('Kiran Reddy', 'kiran@gmail.com', 'hashed_password_4', '9012345678');

-- READ: View users without password_hash
SELECT id, full_name, email, phone, is_active, created_at
FROM users;

-- READ: Find one user by id
SELECT id, full_name, email, phone, is_active
FROM users
WHERE id = 1;

-- READ: Find user by email for login
SELECT id, full_name, email, password_hash, is_active
FROM users
WHERE email = 'prasanna@gmail.com';

-- UPDATE: Update phone number
UPDATE users
SET phone = '9999999999'
WHERE id = 1;

-- UPDATE: Deactivate user
UPDATE users
SET is_active = FALSE
WHERE id = 2;

-- DELETE: Delete one user
DELETE FROM users
WHERE id = 3;

-- CREATE: Insert new property
INSERT INTO properties 
(title, description, price, city, address, bedrooms, bathrooms, area_sqft, property_type, status, is_featured)
VALUES
('Studio Flat in Leeds', 'Affordable studio flat near city centre.', 120000.00, 'Leeds', 'City Centre, Leeds', 1, 1, 500, 'Studio', 'AVAILABLE', FALSE);

-- READ: View properties
SELECT id, title, price, city, property_type, status
FROM properties;

-- READ: View one property
SELECT id, title, price, city, property_type, status
FROM properties
WHERE id = 1;

-- UPDATE: Update property price
UPDATE properties
SET price = 875000.00
WHERE id = 1;

-- UPDATE: Update property status
UPDATE properties
SET status = 'SOLD'
WHERE id = 2;

-- SOFT DELETE STYLE: Mark property as removed
UPDATE properties
SET status = 'REMOVED'
WHERE id = 4;

-- PostgreSQL RETURNING example
INSERT INTO users (full_name, email, password_hash, phone)
VALUES ('Sneha Reddy', 'sneha@gmail.com', 'hashed_password_5', '9000000000')
RETURNING id, full_name, email, created_at;