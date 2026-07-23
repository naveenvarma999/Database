-- Day 29: EXPLAIN ANALYZE and Query Optimization

-- 1. Create demo table
DROP TABLE IF EXISTS demo_big_properties;

CREATE TABLE demo_big_properties (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    city VARCHAR(100),
    price NUMERIC,
    status VARCHAR(30)
);

-- 2. Insert 50,000 demo rows
INSERT INTO demo_big_properties (title, city, price, status)
SELECT 
    'Property ' || gs,
    CASE
        WHEN gs % 5 = 0 THEN 'London'
        WHEN gs % 5 = 1 THEN 'Manchester'
        WHEN gs % 5 = 2 THEN 'Birmingham'
        WHEN gs % 5 = 3 THEN 'Leeds'
        ELSE 'Liverpool'
    END,
    100000 + (gs * 10),
    CASE
        WHEN gs % 3 = 0 THEN 'AVAILABLE'
        WHEN gs % 3 = 1 THEN 'BOOKED'
        ELSE 'SOLD'
    END
FROM generate_series(1, 50000) AS gs;

-- 3. Check total rows
SELECT COUNT(*)
FROM demo_big_properties;

-- 4. Check city query before index
EXPLAIN ANALYZE
SELECT *
FROM demo_big_properties
WHERE city = 'London';

-- 5. Create index on city
CREATE INDEX idx_demo_big_properties_city
ON demo_big_properties(city);

-- 6. Check city query after index
EXPLAIN ANALYZE
SELECT *
FROM demo_big_properties
WHERE city = 'London';

-- 7. Check price query before index
EXPLAIN ANALYZE
SELECT *
FROM demo_big_properties
WHERE price BETWEEN 200000 AND 250000;

-- 8. Create index on price
CREATE INDEX idx_demo_big_properties_price
ON demo_big_properties(price);

-- 9. Check price query after index
EXPLAIN ANALYZE
SELECT *
FROM demo_big_properties
WHERE price BETWEEN 200000 AND 250000;

-- 10. Create composite index
CREATE INDEX idx_demo_big_properties_city_status
ON demo_big_properties(city, status);

-- 11. Check composite index query
EXPLAIN ANALYZE
SELECT *
FROM demo_big_properties
WHERE city = 'London'
AND status = 'AVAILABLE';

-- 12. Select only needed columns
EXPLAIN ANALYZE
SELECT id, title, price
FROM demo_big_properties
WHERE city = 'London';

-- 13. Cleanup after practice
-- DROP TABLE IF EXISTS demo_big_properties;