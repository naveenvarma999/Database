-- Day 33: Full-Text Search in PostgreSQL

-- 1. LIKE search
SELECT id, title, city, price
FROM properties
WHERE title LIKE '%villa%';


-- 2. ILIKE search
SELECT id, title, city, price
FROM properties
WHERE title ILIKE '%villa%';


-- 3. Convert text to searchable format
SELECT to_tsvector('english', 'Luxury villa with garden and parking');


-- 4. Convert search text to query format
SELECT plainto_tsquery('english', 'luxury garden');


-- 5. Full-text search on title
SELECT id, title, city, price
FROM properties
WHERE to_tsvector('english', title)
@@ plainto_tsquery('english', 'villa');


-- 6. Full-text search on title and description
SELECT id, title, description, city, price
FROM properties
WHERE to_tsvector(
    'english',
    COALESCE(title, '') || ' ' || COALESCE(description, '')
)
@@ plainto_tsquery('english', 'garden parking');


-- 7. Full-text search with ranking
SELECT 
    id,
    title,
    city,
    price,
    ts_rank(
        to_tsvector('english', COALESCE(title, '') || ' ' || COALESCE(description, '')),
        plainto_tsquery('english', 'garden parking')
    ) AS search_rank
FROM properties
WHERE to_tsvector('english', COALESCE(title, '') || ' ' || COALESCE(description, ''))
@@ plainto_tsquery('english', 'garden parking')
ORDER BY search_rank DESC;


-- 8. Create GIN index for full-text search
CREATE INDEX IF NOT EXISTS idx_properties_full_text_search
ON properties
USING GIN (
    to_tsvector('english', COALESCE(title, '') || ' ' || COALESCE(description, ''))
);


-- 9. Check performance using EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT id, title, city, price
FROM properties
WHERE to_tsvector('english', COALESCE(title, '') || ' ' || COALESCE(description, ''))
@@ plainto_tsquery('english', 'garden parking');


-- 10. Drop index example
-- DROP INDEX IF EXISTS idx_properties_full_text_search;