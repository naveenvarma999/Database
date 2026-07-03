-- Day 9: INNER JOIN in PostgreSQL

-- 1. Check users
SELECT id, full_name, email
FROM users
ORDER BY id ASC;

-- 2. Check properties
SELECT id, title, city, price, owner_id
FROM properties
ORDER BY id ASC;

-- 3. Basic INNER JOIN
SELECT 
    p.id AS property_id,
    p.title,
    p.city,
    p.price,
    p.owner_id,
    u.full_name AS owner_name,
    u.email AS owner_email
FROM properties p
INNER JOIN users u
ON p.owner_id = u.id
ORDER BY p.id ASC;

-- 4. Available properties with owner details
SELECT 
    p.id,
    p.title,
    p.price,
    p.city,
    p.status,
    u.full_name AS owner_name
FROM properties p
INNER JOIN users u
ON p.owner_id = u.id
WHERE p.status = 'AVAILABLE'
ORDER BY p.price DESC;

-- 5. London properties with owner details
SELECT 
    p.id,
    p.title,
    p.price,
    p.city,
    u.full_name AS owner_name,
    u.email AS owner_email
FROM properties p
INNER JOIN users u
ON p.owner_id = u.id
WHERE p.city = 'London'
ORDER BY p.price DESC;

-- 6. Price range filter with owner details
SELECT 
    p.id,
    p.title,
    p.price,
    p.city,
    p.property_type,
    u.full_name AS owner_name
FROM properties p
INNER JOIN users u
ON p.owner_id = u.id
WHERE p.status = 'AVAILABLE'
AND p.price BETWEEN 200000 AND 800000
ORDER BY p.price ASC;

-- 7. Search title containing villa
SELECT 
    p.id,
    p.title,
    p.price,
    p.city,
    u.full_name AS owner_name
FROM properties p
INNER JOIN users u
ON p.owner_id = u.id
WHERE p.title ILIKE '%villa%'
ORDER BY p.price DESC;

-- 8. INNER JOIN with pagination
SELECT 
    p.id,
    p.title,
    p.price,
    p.city,
    p.property_type,
    u.full_name AS owner_name
FROM properties p
INNER JOIN users u
ON p.owner_id = u.id
WHERE p.status = 'AVAILABLE'
ORDER BY p.created_at DESC
LIMIT 5 OFFSET 0;

-- 9. Count joined records for pagination
SELECT COUNT(*) AS total_available_properties
FROM properties p
INNER JOIN users u
ON p.owner_id = u.id
WHERE p.status = 'AVAILABLE';

-- 10. Real backend search API style query
SELECT 
    p.id,
    p.title,
    p.price,
    p.city,
    p.bedrooms,
    p.bathrooms,
    p.property_type,
    p.status,
    u.full_name AS owner_name,
    u.email AS owner_email
FROM properties p
INNER JOIN users u
ON p.owner_id = u.id
WHERE p.city = 'London'
AND p.price BETWEEN 200000 AND 900000
AND p.property_type IN ('Apartment', 'House')
AND p.status = 'AVAILABLE'
ORDER BY p.price DESC
LIMIT 5 OFFSET 0;