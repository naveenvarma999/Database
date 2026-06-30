-- Day 4: Filtering Data

-- Add more sample properties
INSERT INTO properties 
(title, description, price, city, address, bedrooms, bathrooms, area_sqft, property_type, status, is_featured)
VALUES
('Budget Apartment in London', 'Affordable apartment suitable for small families.', 300000.00, 'London', 'East London', 2, 1, 800, 'Apartment', 'AVAILABLE', FALSE),

('Premium House in Manchester', 'Large premium house with parking.', 550000.00, 'Manchester', 'Salford, Manchester', 4, 3, 2100, 'House', 'AVAILABLE', TRUE),

('Luxury Villa in Birmingham', 'Luxury villa with garden and private parking.', 750000.00, 'Birmingham', 'Solihull, Birmingham', 5, 4, 3200, 'Villa', 'SOLD', TRUE),

('Studio Apartment in Leeds', 'Small studio apartment near university.', 120000.00, 'Leeds', 'Headingley, Leeds', 1, 1, 450, 'Studio', 'AVAILABLE', FALSE),

('Family House in London', 'Good family house near schools.', 680000.00, 'London', 'Croydon, London', 3, 2, 1600, 'House', 'AVAILABLE', TRUE);

-- 1. Available properties
SELECT id, title, price, city, status
FROM properties
WHERE status = 'AVAILABLE';

-- 2. Properties in London
SELECT id, title, price, city
FROM properties
WHERE city = 'London';

-- 3. Properties below 500000
SELECT id, title, price, city
FROM properties
WHERE price < 500000;

-- 4. London available properties
SELECT id, title, price, city, status
FROM properties
WHERE city = 'London'
AND status = 'AVAILABLE';

-- 5. Properties in London or Manchester
SELECT id, title, price, city
FROM properties
WHERE city IN ('London', 'Manchester');

-- 6. Properties between 200000 and 700000
SELECT id, title, price, city
FROM properties
WHERE price BETWEEN 200000 AND 700000;

-- 7. Search property title containing apartment
SELECT id, title, price, city
FROM properties
WHERE title ILIKE '%apartment%';

-- 8. Featured available properties
SELECT id, title, price, city, is_featured, status
FROM properties
WHERE is_featured = TRUE
AND status = 'AVAILABLE';

-- 9. Properties with 3 or more bedrooms
SELECT id, title, bedrooms, price, city
FROM properties
WHERE bedrooms >= 3;

-- 10. Available houses or villas
SELECT id, title, property_type, status, price
FROM properties
WHERE property_type IN ('House', 'Villa')
AND status = 'AVAILABLE';

-- 11. Users with Gmail accounts
SELECT id, full_name, email
FROM users
WHERE email LIKE '%gmail.com';

-- 12. Users with phone number
SELECT id, full_name, email, phone
FROM users
WHERE phone IS NOT NULL;

-- 13. Active users
SELECT id, full_name, email, is_active
FROM users
WHERE is_active = TRUE;