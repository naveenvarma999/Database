# Day 3 - CRUD Operations

## What I learned

CRUD means Create, Read, Update, and Delete.

These are the most common database operations used in backend applications.

## CRUD full form

- Create = INSERT
- Read = SELECT
- Update = UPDATE
- Delete = DELETE

## Important rules

1. Never expose password_hash in normal SELECT queries.
2. Never run UPDATE without WHERE.
3. Never run DELETE without WHERE.
4. In real projects, soft delete is often better than permanent delete.
5. Use SELECT with specific columns instead of SELECT * when possible.

## Real job examples

- User registration uses INSERT.
- User profile page uses SELECT.
- Update profile uses UPDATE.
- Remove account or deactivate account uses DELETE or soft delete.

## Interview answer

CRUD operations are the basic operations used to manage data in a database. INSERT creates records, SELECT reads records, UPDATE modifies records, and DELETE removes records. In backend development, most APIs are built around CRUD operations.