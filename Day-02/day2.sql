CREATE TABLE properties (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(12,2) NOT NULL,
    city VARCHAR(100) NOT NULL,
    address TEXT,
    bedrooms INT,
    bathrooms INT,
    area_sqft INT,
    property_type VARCHAR(50),
    status VARCHAR(30) DEFAULT 'AVAILABLE',
    is_featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO properties 
(title, description, price, city, address, bedrooms, bathrooms, area_sqft, property_type, status, is_featured)
VALUES
('Luxury Villa in London', 'A modern luxury villa with garden and parking.', 850000.00, 'London', 'Chelsea, London', 5, 4, 3500, 'Villa', 'AVAILABLE', TRUE),

('Modern Apartment in Manchester', 'A clean and modern apartment near the city centre.', 250000.00, 'Manchester', 'Deansgate, Manchester', 2, 2, 950, 'Apartment', 'AVAILABLE', FALSE),

('Family House in Birmingham', 'Spacious family house with backyard.', 420000.00, 'Birmingham', 'Edgbaston, Birmingham', 4, 3, 2200, 'House', 'AVAILABLE', TRUE);

SELECT * FROM properties;

SELECT id, title, price, city, property_type, status
FROM properties;

SELECT id, title, price, city
FROM properties
WHERE city = 'London';

SELECT id, title, price, city
FROM properties
WHERE price < 500000;

SELECT id, title, price, city
FROM properties
WHERE is_featured = TRUE;