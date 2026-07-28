-- Day 35: Normalization and Denormalization

-- 1. Create amenities table
CREATE TABLE IF NOT EXISTS amenities (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- 2. Create many-to-many table between properties and amenities
CREATE TABLE IF NOT EXISTS property_amenities (
    property_id BIGINT NOT NULL,
    amenity_id BIGINT NOT NULL,
    PRIMARY KEY (property_id, amenity_id),
    FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE,
    FOREIGN KEY (amenity_id) REFERENCES amenities(id) ON DELETE CASCADE
);

-- 3. Insert amenities
INSERT INTO amenities (name)
VALUES 
('parking'),
('garden'),
('wifi'),
('balcony'),
('lift')
ON CONFLICT (name) DO NOTHING;

-- 4. Connect property 1 with amenities
INSERT INTO property_amenities (property_id, amenity_id)
SELECT 1, id
FROM amenities
WHERE name IN ('parking', 'garden', 'wifi')
ON CONFLICT DO NOTHING;

-- 5. View property amenities
SELECT 
    p.id,
    p.title,
    a.name AS amenity
FROM properties p
JOIN property_amenities pa
ON pa.property_id = p.id
JOIN amenities a
ON a.id = pa.amenity_id
WHERE p.id = 1;

-- 6. Show amenities as comma-separated list
SELECT 
    p.id,
    p.title,
    STRING_AGG(a.name, ', ') AS amenities
FROM properties p
JOIN property_amenities pa
ON pa.property_id = p.id
JOIN amenities a
ON a.id = pa.amenity_id
GROUP BY p.id, p.title;

-- 7. Normalized saved count query
SELECT 
    p.id,
    p.title,
    COUNT(sp.user_id) AS saved_count
FROM properties p
LEFT JOIN saved_properties sp
ON sp.property_id = p.id
GROUP BY p.id, p.title
ORDER BY saved_count DESC;