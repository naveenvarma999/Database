# Day 11 - Many-to-Many Relationship using Junction Table

## What I learned

A many-to-many relationship means many records in one table can connect to many records in another table.

Example:
One user can save many properties, and one property can be saved by many users.

## Tables used

- users
- properties
- saved_properties

## Junction table

A junction table is used to connect two tables in a many-to-many relationship.

In this project, saved_properties is the junction table.

## Relationship

users.id connects to saved_properties.user_id  
properties.id connects to saved_properties.property_id

## Composite primary key

The saved_properties table uses:

PRIMARY KEY (user_id, property_id)

This prevents the same user from saving the same property multiple times.

## Why not store comma-separated IDs?

Bad design:
saved_property_ids = "1,2,3"

This is bad because it is hard to join, search, count, validate, and enforce foreign keys.

Correct design:
Use a separate saved_properties table.

## Real job use

Many-to-many relationships are used in:

- Users and saved properties
- Users and roles
- Students and courses
- Products and orders
- Movies and actors

## Important SQL learned

- CREATE TABLE for junction table
- Composite primary key
- Foreign keys
- ON DELETE CASCADE
- ON CONFLICT DO NOTHING
- Three-table JOIN
- COUNT with GROUP BY
- EXISTS
- DELETE saved relationship

## Interview answer

A many-to-many relationship means multiple records in one table can be related to multiple records in another table. It is implemented using a junction table. For example, users and properties have a many-to-many relationship through saved_properties, where one user can save many properties and one property can be saved by many users.