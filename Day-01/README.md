# Day 1 - Database Basics

## What I learned

A database is used to store application data permanently.

In a real backend application, the frontend sends data to the backend, and the backend stores that data in the database.

## Important terms

### Database
A database is a storage system for application data.

Example:
daydream_db

### Table
A table stores one type of data.

Example:
users table

### Row
A row is one record in a table.

Example:
one user record

### Column
A column is one field in a table.

Example:
id, full_name, email, phone

### Primary Key
A primary key uniquely identifies each row.

Example:
users.id

### Foreign Key
A foreign key connects one table to another table.

Example:
properties.owner_id connects to users.id

## Practical completed

- Installed PostgreSQL
- Opened pgAdmin 4
- Created database: daydream_db
- Created users table
- Inserted sample users
- Ran SELECT query

## Interview answer

Applications need databases to store data permanently. For example, when a user registers, books a property, or saves a property, that data must be stored and retrieved later.