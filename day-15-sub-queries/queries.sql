
CREATE DATABASE subquery_practice_db;

CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE properties (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(12,2) NOT NULL CHECK (price > 0),
    city VARCHAR(100) NOT NULL,
    address TEXT,
    bedrooms INT CHECK (bedrooms IS NULL OR bedrooms >= 0),
    bathrooms INT CHECK (bathrooms IS NULL OR bathrooms >= 0),
    area_sqft INT CHECK (area_sqft IS NULL OR area_sqft > 0),
    property_type VARCHAR(50) CHECK (
        property_type IN ('Villa', 'Apartment', 'House', 'Studio')
    ),
    status VARCHAR(30) DEFAULT 'AVAILABLE' CHECK (
        status IN ('AVAILABLE', 'SOLD', 'BOOKED', 'REMOVED')
    ),
    is_featured BOOLEAN DEFAULT FALSE,
    owner_id BIGINT REFERENCES users(id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE saved_properties (
    user_id BIGINT NOT NULL,
    property_id BIGINT NOT NULL,
    saved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (user_id, property_id),

    CONSTRAINT fk_saved_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_saved_property
        FOREIGN KEY (property_id)
        REFERENCES properties(id)
        ON DELETE CASCADE
);


INSERT INTO users (full_name, email, phone, is_active)
VALUES
('Prasanna Bekkam', 'prasanna@gmail.com', '9000000001', TRUE),
('Rahul Kumar', 'rahul@gmail.com', '9000000002', TRUE),
('Anjali Sharma', 'anjali@gmail.com', '9000000003', TRUE),
('Kiran Reddy', 'kiran@yahoo.com', '9000000004', TRUE),
('Meera Nair', 'meera@hotmail.com', '9000000005', FALSE),
('Vikram Singh', 'vikram@gmail.com', '9000000006', TRUE),
('Divya Rao', 'divya@gmail.com', '9000000007', TRUE),
('John Smith', 'john@yahoo.com', '9000000008', FALSE),
('Sneha Kapoor', 'sneha@gmail.com', '9000000009', TRUE),
('Naveen Kumar', 'naveen@gmail.com', '9000000010', TRUE);



INSERT INTO properties
(title, description, price, city, address, bedrooms, bathrooms, area_sqft, property_type, status, is_featured, owner_id)
VALUES
('Luxury Villa in London', 'Premium villa with garden and parking.', 950000.00, 'London', 'Chelsea, London', 5, 4, 4200, 'Villa', 'AVAILABLE', TRUE, 1),

('Budget Apartment in London', 'Affordable apartment near transport.', 300000.00, 'London', 'East London', 2, 1, 800, 'Apartment', 'AVAILABLE', FALSE, 1),

('Family House in Birmingham', 'Spacious family house with backyard.', 420000.00, 'Birmingham', 'Edgbaston, Birmingham', 4, 3, 2200, 'House', 'AVAILABLE', TRUE, 2),

('Modern Apartment in Manchester', 'Modern city centre apartment.', 250000.00, 'Manchester', 'Deansgate, Manchester', 2, 2, 950, 'Apartment', 'AVAILABLE', FALSE, 2),

('Premium House in Manchester', 'Large premium house with parking.', 620000.00, 'Manchester', 'Didsbury, Manchester', 4, 3, 2400, 'House', 'AVAILABLE', TRUE, 3),

('Studio Flat in Leeds', 'Small studio suitable for students.', 120000.00, 'Leeds', 'Headingley, Leeds', 1, 1, 450, 'Studio', 'AVAILABLE', FALSE, 3),

('Luxury Villa in Birmingham', 'Luxury villa with private garden.', 780000.00, 'Birmingham', 'Solihull, Birmingham', 5, 4, 3500, 'Villa', 'SOLD', TRUE, 4),

('Simple House in London', 'Good house in a peaceful area.', 520000.00, 'London', 'Croydon, London', 3, 2, 1600, 'House', 'SOLD', FALSE, 4),

('Premium Apartment in London', 'High-end apartment with city view.', 480000.00, 'London', 'Canary Wharf, London', 2, 2, 1100, 'Apartment', 'AVAILABLE', TRUE, 6),

('Budget Studio in Manchester', 'Small studio near university area.', 125000.00, 'Manchester', 'Oxford Road, Manchester', 1, 1, 420, 'Studio', 'AVAILABLE', FALSE, 6),

('Family Villa in Bristol', 'Spacious villa suitable for families.', 700000.00, 'Bristol', 'Clifton, Bristol', 4, 3, 2800, 'Villa', 'BOOKED', TRUE, 7),

('Affordable House in Leeds', 'Good house for first-time buyers.', 210000.00, 'Leeds', 'Roundhay, Leeds', 3, 2, 1400, 'House', 'AVAILABLE', FALSE, 7),

('Luxury Apartment in Bristol', 'Premium apartment near city centre.', 560000.00, 'Bristol', 'Harbourside, Bristol', 3, 2, 1500, 'Apartment', 'AVAILABLE', TRUE, 9),

('Unassigned Property in Liverpool', 'Property without assigned owner.', 275000.00, 'Liverpool', 'City Centre, Liverpool', 2, 1, 850, 'Apartment', 'AVAILABLE', FALSE, NULL),

('Removed Old Property', 'Old removed listing.', 180000.00, 'Birmingham', 'Old Street, Birmingham', 2, 1, 900, 'House', 'REMOVED', FALSE, NULL);



INSERT INTO saved_properties (user_id, property_id)
VALUES
(1, 1),
(1, 3),
(1, 5),
(1, 9),

(2, 1),
(2, 2),
(2, 5),

(3, 1),
(3, 7),
(3, 11),

(4, 3),
(4, 5),
(4, 13),

(6, 1),
(6, 9),
(6, 13),

(7, 2),
(7, 4),
(7, 12),

(9, 1),
(9, 5),
(9, 11),
(9, 13),

(10, 2),
(10, 6),
(10, 10);



-- Day 15: Subqueries in PostgreSQL

-- 1. Properties above average price
SELECT id, title, city, price
FROM properties
WHERE price > (
    SELECT AVG(price)
    FROM properties
)
ORDER BY price DESC;

-- 2. Properties below average price
SELECT id, title, city, price
FROM properties
WHERE price < (
    SELECT AVG(price)
    FROM properties
)
ORDER BY price ASC;

-- 3. Most expensive property
SELECT id, title, city, price
FROM properties
WHERE price = (
    SELECT MAX(price)
    FROM properties
);

-- 4. Cheapest property
SELECT id, title, city, price
FROM properties
WHERE price = (
    SELECT MIN(price)
    FROM properties
);

-- 5. Properties greater than London average price
SELECT id, title, city, price
FROM properties
WHERE price > (
    SELECT AVG(price)
    FROM properties
    WHERE city = 'London'
)
ORDER BY price DESC;

-- 6. Properties owned by active users
SELECT id, title, city, price, owner_id
FROM properties
WHERE owner_id IN (
    SELECT id
    FROM users
    WHERE is_active = TRUE
);

-- 7. Users who own properties
SELECT id, full_name, email
FROM users
WHERE id IN (
    SELECT owner_id
    FROM properties
    WHERE owner_id IS NOT NULL
);

-- 8. Users who saved properties
SELECT id, full_name, email
FROM users
WHERE id IN (
    SELECT user_id
    FROM saved_properties
);

-- 9. Properties saved by users
SELECT id, title, city, price
FROM properties
WHERE id IN (
    SELECT property_id
    FROM saved_properties
);

-- 10. Users who have not saved any property
SELECT id, full_name, email
FROM users
WHERE id NOT IN (
    SELECT user_id
    FROM saved_properties
    WHERE user_id IS NOT NULL
);

-- 11. Properties not saved by anyone
SELECT id, title, city, price
FROM properties
WHERE id NOT IN (
    SELECT property_id
    FROM saved_properties
    WHERE property_id IS NOT NULL
);

-- 12. Property with saved count using subquery in SELECT
SELECT 
    p.id,
    p.title,
    p.city,
    p.price,
    (
        SELECT COUNT(*)
        FROM saved_properties sp
        WHERE sp.property_id = p.id
    ) AS saved_count
FROM properties p
ORDER BY saved_count DESC;

-- 13. User with property count using subquery in SELECT
SELECT 
    u.id,
    u.full_name,
    u.email,
    (
        SELECT COUNT(*)
        FROM properties p
        WHERE p.owner_id = u.id
    ) AS total_properties
FROM users u
ORDER BY total_properties DESC;

-- 14. Subquery inside FROM
SELECT *
FROM (
    SELECT 
        city,
        ROUND(AVG(price), 2) AS average_price,
        COUNT(*) AS total_properties
    FROM properties
    GROUP BY city
) AS city_stats
WHERE average_price > 400000
ORDER BY average_price DESC;

-- 15. Available properties above average available price
SELECT id, title, city, price, status
FROM properties
WHERE status = 'AVAILABLE'
AND price > (
    SELECT AVG(price)
    FROM properties
    WHERE status = 'AVAILABLE'
)
ORDER BY price DESC;

-- 16. Subquery version: users who own properties
SELECT id, full_name, email
FROM users
WHERE id IN (
    SELECT owner_id
    FROM properties
    WHERE owner_id IS NOT NULL
);

-- 17. JOIN version: users who own properties
SELECT DISTINCT u.id, u.full_name, u.email
FROM users u
INNER JOIN properties p
ON p.owner_id = u.id;

-- 18. Advanced: properties saved more than average saved count
SELECT 
    p.id,
    p.title,
    p.city,
    p.price,
    COUNT(sp.user_id) AS saved_count
FROM properties p
LEFT JOIN saved_properties sp
ON sp.property_id = p.id
GROUP BY p.id, p.title, p.city, p.price
HAVING COUNT(sp.user_id) > (
    SELECT AVG(saved_total)
    FROM (
        SELECT COUNT(*) AS saved_total
        FROM saved_properties
        GROUP BY property_id
    ) AS saved_stats
)
ORDER BY saved_count DESC;