-- Day 6: Constraints in PostgreSQL

-- 1. Price must be positive
ALTER TABLE properties
DROP CONSTRAINT IF EXISTS chk_properties_price_positive;

ALTER TABLE properties
ADD CONSTRAINT chk_properties_price_positive
CHECK (price > 0);


-- 2. Bedrooms cannot be negative
ALTER TABLE properties
DROP CONSTRAINT IF EXISTS chk_properties_bedrooms_non_negative;

ALTER TABLE properties
ADD CONSTRAINT chk_properties_bedrooms_non_negative
CHECK (bedrooms IS NULL OR bedrooms >= 0);


-- 3. Bathrooms cannot be negative
ALTER TABLE properties
DROP CONSTRAINT IF EXISTS chk_properties_bathrooms_non_negative;

ALTER TABLE properties
ADD CONSTRAINT chk_properties_bathrooms_non_negative
CHECK (bathrooms IS NULL OR bathrooms >= 0);


-- 4. Area must be positive if provided
ALTER TABLE properties
DROP CONSTRAINT IF EXISTS chk_properties_area_positive;

ALTER TABLE properties
ADD CONSTRAINT chk_properties_area_positive
CHECK (area_sqft IS NULL OR area_sqft > 0);


-- 5. Status must be valid
ALTER TABLE properties
DROP CONSTRAINT IF EXISTS chk_properties_status_valid;

ALTER TABLE properties
ADD CONSTRAINT chk_properties_status_valid
CHECK (status IN ('AVAILABLE', 'SOLD', 'BOOKED', 'REMOVED'));


-- 6. Property type must be valid
ALTER TABLE properties
DROP CONSTRAINT IF EXISTS chk_properties_type_valid;

ALTER TABLE properties
ADD CONSTRAINT chk_properties_type_valid
CHECK (
    property_type IS NULL
    OR property_type IN ('Villa', 'Apartment', 'House', 'Studio')
);


-- 7. Phone number length validation
ALTER TABLE users
DROP CONSTRAINT IF EXISTS chk_users_phone_length;

ALTER TABLE users
ADD CONSTRAINT chk_users_phone_length
CHECK (phone IS NULL OR LENGTH(phone) BETWEEN 10 AND 20);


-- 8. Test DEFAULT values
INSERT INTO properties (title, price, city)
VALUES ('Default Test Property', 150000.00, 'London')
RETURNING id, title, price, city, status, is_featured, created_at;


-- 9. View properties
SELECT id, title, price, city, status, property_type, is_featured, created_at
FROM properties
ORDER BY id ASC;


-- NOTE:
-- Run the below invalid queries separately only for testing.
-- They are expected to fail.

-- Invalid negative price test
-- INSERT INTO properties (title, price, city)
-- VALUES ('Invalid Negative Price Property', -50000.00, 'London');

-- Invalid status test
-- INSERT INTO properties (title, price, city, status)
-- VALUES ('Invalid Status Property', 250000.00, 'London', 'PENDING');

-- Duplicate email test
-- INSERT INTO users (full_name, email, password_hash, phone)
-- VALUES ('Duplicate User', 'prasanna@gmail.com', 'hash123', '9999999999');