-- Day 36: Database Migrations and Schema Changes

-- 1. Create property reviews table
CREATE TABLE IF NOT EXISTS property_reviews (
    id BIGSERIAL PRIMARY KEY,
    property_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_review_property
        FOREIGN KEY (property_id)
        REFERENCES properties(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_review_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT unique_user_property_review
        UNIQUE (property_id, user_id)
);

-- 2. Insert sample review
INSERT INTO property_reviews (property_id, user_id, rating, review_text)
VALUES (1, 1, 5, 'Excellent property with great location.')
ON CONFLICT (property_id, user_id) DO NOTHING;

-- 3. View reviews
SELECT *
FROM property_reviews;

-- 4. Add new column
ALTER TABLE property_reviews
ADD COLUMN IF NOT EXISTS is_approved BOOLEAN DEFAULT FALSE;

-- 5. Approve review
UPDATE property_reviews
SET is_approved = TRUE
WHERE property_id = 1
AND user_id = 1;

-- 6. Check approved reviews
SELECT id, property_id, user_id, rating, review_text, is_approved
FROM property_reviews;

-- 7. Add index for property reviews
CREATE INDEX IF NOT EXISTS idx_property_reviews_property_id
ON property_reviews(property_id);

-- 8. Add index for user reviews
CREATE INDEX IF NOT EXISTS idx_property_reviews_user_id
ON property_reviews(user_id);

-- 9. Query reviews for one property
SELECT *
FROM property_reviews
WHERE property_id = 1;

-- 10. Down migration examples
-- DROP INDEX IF EXISTS idx_property_reviews_property_id;
-- DROP INDEX IF EXISTS idx_property_reviews_user_id;
-- ALTER TABLE property_reviews DROP COLUMN IF EXISTS is_approved;
-- DROP TABLE IF EXISTS property_reviews;