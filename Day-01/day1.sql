CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    phone VARCHAR(20),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO users (full_name, email, password_hash, phone)
VALUES
('Naveen', 'naveen@gmail.com', 'hashed_password_1', '98765'),
('Rahul Kumar', 'rahul@gmail.com', 'hashed_password_2', '9123456'),
('Anjali Sharma', 'anjali@gmail.com', 'hashed_password_3', '9988776');