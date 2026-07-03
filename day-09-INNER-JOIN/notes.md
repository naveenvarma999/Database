# Day 9 - INNER JOIN in PostgreSQL

## What I learned

INNER JOIN is used to combine matching records from two tables.

In the DayDream database, properties are connected to users using owner_id.

Relationship:
properties.owner_id references users.id

## Why INNER JOIN is used

In the properties table, we only store owner_id.

But in the application, we may need to show property details with owner name and owner email.

For that, we use INNER JOIN.

## Syntax

SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;

## Example

SELECT p.title, p.price, u.full_name
FROM properties p
INNER JOIN users u
ON p.owner_id = u.id;

## Important rule

INNER JOIN returns only matching records from both tables.

If a property has no owner_id, it will not appear in INNER JOIN result.

## Real job use

INNER JOIN is used in:

- Property listing with owner details
- Booking details with user details
- Payment details with booking details
- Order details with customer details
- Admin dashboard reports

## Important points

1. Use aliases like p and u for clean queries.
2. Always write a proper ON condition.
3. Use selected columns instead of SELECT *.
4. INNER JOIN only returns matching rows.
5. JOIN queries can be combined with WHERE, ORDER BY, LIMIT, and OFFSET.

## Interview answer

INNER JOIN is used to fetch matching records from two related tables. For example, in a real estate system, properties.owner_id can be joined with users.id to show property details along with owner information. INNER JOIN only returns rows where matching data exists in both tables.