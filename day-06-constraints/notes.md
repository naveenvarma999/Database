# Day 6 - Constraints in PostgreSQL

## What I learned

Constraints are rules applied to database tables to protect data quality.

They stop invalid, duplicate, missing, or wrong data from being stored.

## Important constraints

### PRIMARY KEY
Uniquely identifies each row in a table.

Example:
id BIGSERIAL PRIMARY KEY

### NOT NULL
Makes sure a column must have a value.

Example:
full_name VARCHAR(100) NOT NULL

### UNIQUE
Makes sure duplicate values are not allowed.

Example:
email VARCHAR(150) UNIQUE

### DEFAULT
Automatically adds a value if no value is provided.

Example:
is_active BOOLEAN DEFAULT TRUE

### CHECK
Validates data using a condition.

Example:
CHECK (price > 0)

### FOREIGN KEY
Connects one table to another table.

Example:
properties.owner_id connects to users.id

## Real job use

Constraints protect the database even if the backend has a bug.

Example:
A backend bug may send a negative price, but the database CHECK constraint can reject it.

## Important rules

1. Use NOT NULL for required fields.
2. Use UNIQUE for email, username, or other unique values.
3. Use CHECK for business rules like price > 0.
4. Use DEFAULT for automatic values like status and created_at.
5. Use PRIMARY KEY for unique row identification.
6. Use FOREIGN KEY to connect related tables.

## Interview answer

Constraints are database rules used to maintain data accuracy and integrity. Common constraints are PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, DEFAULT, and CHECK. They help prevent invalid data, duplicate data, and missing required values.