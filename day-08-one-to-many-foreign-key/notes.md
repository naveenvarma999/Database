-- Day 8: One-to-Many Relationship using Foreign Key

-- 1. Check users
SELECT id, full_name, email
FROM users
ORDER BY id ASC;

-- 2. Check properties
SELECT id, title, city, price
FROM properties
ORDER BY id ASC;

-- 3. Add owner_id column to properties
ALTER TABLE properties
ADD COLUMN IF NOT EXISTS owner_id BIGINT;

-- 4. Add foreign key constraint
ALTER TABLE properties
DROP CONSTRAINT IF EXISTS fk_properties_owner;

ALTER TABLE properties
ADD CONSTRAINT fk_properties_owner
FOREIGN KEY (owner_id)
REFERENCES users(id)
ON DELETE SET NULL;

-- 5. Assign owners to existing properties
-- Change user ids if your users table has different ids.

UPDATE properties
SET owner_id = 1
WHERE id IN (1, 2, 3);

UPDATE properties
SET owner_id = 2
WHERE id IN (4, 5, 6);

UPDATE properties
SET owner_id = 3
WHERE id IN (7, 8, 9);

-- 6. View properties with owner_id
SELECT id, title, city, price, owner_id
FROM properties
ORDER BY id ASC;

-- 7. Insert a new property connected to owner_id 1
INSERT INTO properties
(title, description, price, city, address, bedrooms, bathrooms, area_sqft, property_type, status, is_featured, owner_id)
VALUES
('Owner Linked Apartment', 'Apartment connected to a real user owner.', 350000.00, 'London', 'West London', 2, 2, 900, 'Apartment', 'AVAILABLE', FALSE, 1);

-- 8. View property with owner details using JOIN
SELECT 
    p.id AS property_id,
    p.title,
    p.city,
    p.price,
    u.id AS owner_id,
    u.full_name AS owner_name,
    u.email AS owner_email
FROM properties p
JOIN users u ON p.owner_id = u.id
ORDER BY p.id ASC;

-- 9. View all properties, even if owner is missing
SELECT 
    p.id AS property_id,
    p.title,
    p.city,
    p.price,
    p.owner_id,
    u.full_name AS owner_name
FROM properties p
LEFT JOIN users u ON p.owner_id = u.id
ORDER BY p.id ASC;

-- 10. Count properties owned by each user
SELECT 
    u.id,
    u.full_name,
    COUNT(p.id) AS total_properties
FROM users u
LEFT JOIN properties p ON p.owner_id = u.id
GROUP BY u.id, u.full_name
ORDER BY total_properties DESC;

-- NOTE:
-- Run this invalid test separately.
-- It is expected to fail because owner_id 99999 does not exist.

-- INSERT INTO properties
-- (title, description, price, city, property_type, status, owner_id)
-- VALUES
-- ('Invalid Owner Property', 'This should fail because owner does not exist.', 300000.00, 'London', 'Apartment', 'AVAILABLE', 99999);