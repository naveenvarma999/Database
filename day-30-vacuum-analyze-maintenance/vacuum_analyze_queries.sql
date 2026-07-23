-- Day 30: VACUUM, ANALYZE, and Table Maintenance

-- 1. Check current table statistics
SELECT 
    relname AS table_name,
    n_live_tup AS live_rows,
    n_dead_tup AS dead_rows,
    last_vacuum,
    last_autovacuum,
    last_analyze,
    last_autoanalyze
FROM pg_stat_user_tables
WHERE relname = 'demo_big_properties';


-- 2. Create demo table if needed
DROP TABLE IF EXISTS demo_big_properties;

CREATE TABLE demo_big_properties (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    city VARCHAR(100),
    price NUMERIC,
    status VARCHAR(30)
);


-- 3. Insert demo rows
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


-- 4. Check count
SELECT COUNT(*)
FROM demo_big_properties;


-- 5. Update many rows to create old row versions
UPDATE demo_big_properties
SET price = price + 5000
WHERE city = 'London';

UPDATE demo_big_properties
SET status = 'ARCHIVED'
WHERE status = 'SOLD';


-- 6. Check statistics before vacuum
SELECT 
    relname AS table_name,
    n_live_tup AS live_rows,
    n_dead_tup AS dead_rows,
    last_vacuum,
    last_autovacuum,
    last_analyze,
    last_autoanalyze
FROM pg_stat_user_tables
WHERE relname = 'demo_big_properties';


-- 7. Run ANALYZE only
ANALYZE demo_big_properties;


-- 8. Run VACUUM ANALYZE
VACUUM ANALYZE demo_big_properties;


-- 9. Check statistics after vacuum analyze
SELECT 
    relname AS table_name,
    n_live_tup AS live_rows,
    n_dead_tup AS dead_rows,
    last_vacuum,
    last_autovacuum,
    last_analyze,
    last_autoanalyze
FROM pg_stat_user_tables
WHERE relname = 'demo_big_properties';


-- 10. Use EXPLAIN ANALYZE after statistics update
EXPLAIN ANALYZE
SELECT *
FROM demo_big_properties
WHERE city = 'London';


-- 11. Real project table maintenance examples
-- VACUUM ANALYZE users;
-- VACUUM ANALYZE properties;
-- VACUUM ANALYZE saved_properties;


-- 12. VACUUM FULL example
-- Use carefully because it locks the table
-- VACUUM FULL demo_big_properties;


-- 13. Cleanup
-- DROP TABLE IF EXISTS demo_big_properties;