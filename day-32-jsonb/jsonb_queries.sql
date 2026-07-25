-- Day 32: JSONB in PostgreSQL

DROP TABLE IF EXISTS property_json_details;

CREATE TABLE property_json_details (
    id BIGSERIAL PRIMARY KEY,
    property_id BIGINT,
    details JSONB NOT NULL
);

INSERT INTO property_json_details (property_id, details)
VALUES
(1, '{
    "amenities": ["parking", "garden", "wifi"],
    "furnished": true,
    "pets_allowed": true,
    "nearby": {
        "station": "Colchester",
        "distance_km": 1.2
    }
}'),
(2, '{
    "amenities": ["balcony", "lift", "security"],
    "furnished": false,
    "pets_allowed": false,
    "nearby": {
        "station": "London Liverpool Street",
        "distance_km": 0.8
    }
}');

-- Read all JSONB data
SELECT *
FROM property_json_details;

-- Read JSON field
SELECT 
    property_id,
    details -> 'amenities' AS amenities
FROM property_json_details;

-- Read JSON value as text
SELECT 
    property_id,
    details ->> 'furnished' AS furnished
FROM property_json_details;

-- Read nested JSON value
SELECT 
    property_id,
    details -> 'nearby' ->> 'station' AS nearest_station
FROM property_json_details;

-- Filter by JSONB value
SELECT *
FROM property_json_details
WHERE details ->> 'pets_allowed' = 'true';

-- Check array contains value
SELECT *
FROM property_json_details
WHERE details -> 'amenities' ? 'parking';

-- JSONB containment
SELECT *
FROM property_json_details
WHERE details @> '{"furnished": true}';

-- Update JSONB value
UPDATE property_json_details
SET details = jsonb_set(details, '{pets_allowed}', 'false')
WHERE property_id = 1;

-- Add new JSONB field
UPDATE property_json_details
SET details = jsonb_set(details, '{bills_included}', 'true')
WHERE property_id = 1;

-- Create GIN index for JSONB search
CREATE INDEX idx_property_json_details_gin
ON property_json_details
USING GIN (details);

-- Test JSONB query after index
EXPLAIN ANALYZE
SELECT *
FROM property_json_details
WHERE details @> '{"furnished": true}';