-- Day 10: LEFT JOIN in PostgreSQL

-- 1. Check properties
SELECT id, title, city, price, owner_id
FROM properties
ORDER BY id ASC;

-- 2. Check users
SELECT id, full_name, email
FROM users
ORDER BY id ASC;

-- 3. Insert property without owner
INSERT INTO properties
(title, description, price, city, address, bedrooms, bathrooms, area_sqft, property_type, status, is_featured)
VALUES
('Unassigned Property', 'This property does not have an owner yet.', 275000.00, 'Liverpool', 'City Centre, Liverpool', 2, 1, 850, 'Apartment', 'AVAILABLE', FALSE);

-- 4. Basic LEFT JOIN
SELECT 
    p.id AS property_id,
    p.title,
    p.city,
    p.price,
    p.owner_id,
    u.full_name AS owner_name,
    u.email AS owner_email
FROM properties p
LEFT JOIN users u
ON p.owner_id = u.id
ORDER BY p.id ASC;

-- 5. Compare with INNER JOIN
SELECT 
    p.id AS property_id,
    p.title,
    p.city,
    p.price,
    p.owner_id,
    u.full_name AS owner_name
FROM properties p
INNER JOIN users u
ON p.owner_id = u.id
ORDER BY p.id ASC;

-- 6. Find properties without owners
SELECT 
    p.id,
    p.title,
    p.city,
    p.price,
    p.owner_id
FROM properties p
LEFT JOIN users u
ON p.owner_id = u.id
WHERE u.id IS NULL;

-- 7. Find properties with owners
SELECT 
    p.id,
    p.title,
    p.city,
    p.price,
    u.full_name AS owner_name
FROM properties p
LEFT JOIN users u
ON p.owner_id = u.id
WHERE u.id IS NOT NULL;

-- 8. Available properties with owner if available
SELECT 
    p.id,
    p.title,
    p.price,
    p.city,
    p.status,
    u.full_name AS owner_name
FROM properties p
LEFT JOIN users u
ON p.owner_id = u.id
WHERE p.status = 'AVAILABLE'
ORDER BY p.price DESC;

-- 9. London properties with owner if available
SELECT 
    p.id,
    p.title,
    p.city,
    p.price,
    u.full_name AS owner_name,
    u.email AS owner_email
FROM properties p
LEFT JOIN users u
ON p.owner_id = u.id
WHERE p.city = 'London'
ORDER BY p.price DESC;

-- 10. Search apartment properties with owner if available
SELECT 
    p.id,
    p.title,
    p.price,
    p.city,
    u.full_name AS owner_name
FROM properties p
LEFT JOIN users u
ON p.owner_id = u.id
WHERE p.title ILIKE '%apartment%'
ORDER BY p.price ASC;

-- 11. LEFT JOIN with pagination
SELECT 
    p.id,
    p.title,
    p.price,
    p.city,
    p.property_type,
    p.status,
    u.full_name AS owner_name
FROM properties p
LEFT JOIN users u
ON p.owner_id = u.id
WHERE p.status = 'AVAILABLE'
ORDER BY p.created_at DESC
LIMIT 5 OFFSET 0;

-- 12. Users with property count
SELECT 
    u.id,
    u.full_name,
    u.email,
    COUNT(p.id) AS total_properties
FROM users u
LEFT JOIN properties p
ON p.owner_id = u.id
GROUP BY u.id, u.full_name, u.email
ORDER BY total_properties DESC;

-- 13. Users with zero properties
SELECT 
    u.id,
    u.full_name,
    u.email,
    COUNT(p.id) AS total_properties
FROM users u
LEFT JOIN properties p
ON p.owner_id = u.id
GROUP BY u.id, u.full_name, u.email
HAVING COUNT(p.id) = 0
ORDER BY u.id ASC;

-- 14. Admin listing with COALESCE
SELECT 
    p.id,
    p.title,
    p.price,
    p.city,
    p.status,
    COALESCE(u.full_name, 'Not Assigned') AS owner_name,
    COALESCE(u.email, 'No Email') AS owner_email
FROM properties p
LEFT JOIN users u
ON p.owner_id = u.id
ORDER BY p.created_at DESC;

-- 15. Admin dashboard style query
SELECT 
    p.id,
    p.title,
    p.price,
    p.city,
    p.property_type,
    p.status,
    COALESCE(u.full_name, 'Not Assigned') AS owner_name,
    COALESCE(u.email, 'No Email') AS owner_email,
    p.created_at
FROM properties p
LEFT JOIN users u
ON p.owner_id = u.id
WHERE p.status IN ('AVAILABLE', 'BOOKED', 'SOLD')
ORDER BY p.created_at DESC
LIMIT 10 OFFSET 0;