# Day 7 - Weekly Review

## What I revised

This week I learned the foundation of PostgreSQL database development.

## Topics covered

- Database basics
- Tables
- Rows and columns
- Primary key
- Data types
- CRUD operations
- Filtering data
- Sorting
- LIMIT and OFFSET
- Pagination
- Constraints

## Practical work completed

- Created daydream_db database
- Created users table
- Created properties table
- Inserted sample users
- Inserted sample properties
- Practised SELECT, INSERT, UPDATE, DELETE
- Practised WHERE, AND, OR, IN, BETWEEN, ILIKE
- Practised ORDER BY, LIMIT, OFFSET
- Added constraints for price, status, property type, phone number, bedrooms, bathrooms, and area
- Tested valid and invalid data

## Job-level understanding

I can now create basic database tables, insert data, read data, update data, delete data safely, filter search results, sort records, paginate results, and protect data using constraints.

## Important safety rules

1. Do not expose password_hash in normal SELECT queries.
2. Do not run UPDATE without WHERE.
3. Do not run DELETE without WHERE.
4. Use constraints to protect database data.
5. Use pagination instead of loading all records.
6. Use specific columns instead of SELECT * in real APIs.

## Interview answer

This week I learned how to design and use basic PostgreSQL tables for a real application. I created users and properties tables, used correct data types, performed CRUD operations, filtered and sorted data, implemented pagination, and added constraints to protect data quality.