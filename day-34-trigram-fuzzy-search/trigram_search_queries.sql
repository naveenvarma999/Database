-- Day 34: Trigram / Fuzzy Search in PostgreSQL

-- 1. Enable pg_trgm extension
CREATE EXTENSION IF NOT EXISTS pg_trgm;


-- 2. Check similarity score
SELECT similarity('Luxury Villa', 'Luxry Vila') AS score;


-- 3. Search similar property titles
SELECT 
    id,
    title,
    similarity(title, 'luxry vila') AS similarity_score
FROM properties
WHERE similarity(title, 'luxry vila') > 0.2
ORDER BY similarity_score DESC;


-- 4. Use % operator for fuzzy title search
SELECT id, title, city, price
FROM properties
WHERE title % 'luxry vila';


-- 5. Fuzzy city search
SELECT id, title, city, price
FROM properties
WHERE city % 'manchster';


-- 6. Create trigram index on title
CREATE INDEX IF NOT EXISTS idx_properties_title_trgm
ON properties
USING GIN (title gin_trgm_ops);


-- 7. Create trigram index on city
CREATE INDEX IF NOT EXISTS idx_properties_city_trgm
ON properties
USING GIN (city gin_trgm_ops);


-- 8. Check performance
EXPLAIN ANALYZE
SELECT id, title
FROM properties
WHERE title % 'luxry vila';


-- 9. Real search example
SELECT 
    id,
    title,
    city,
    price,
    similarity(title, 'luxry vila') AS score
FROM properties
WHERE title % 'luxry vila'
ORDER BY score DESC;


-- 10. Drop index examples
-- DROP INDEX IF EXISTS idx_properties_title_trgm;
-- DROP INDEX IF EXISTS idx_properties_city_trgm;