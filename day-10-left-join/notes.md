# Day 10 - LEFT JOIN in PostgreSQL

## What I learned

LEFT JOIN is used to return all records from the left table and matching records from the right table.

If there is no matching record in the right table, the right table columns return NULL.

## Example

properties is the left table.  
users is the right table.

LEFT JOIN shows all properties, even if some properties do not have an owner.

## Syntax

SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;

## INNER JOIN vs LEFT JOIN

INNER JOIN returns only matching records from both tables.

LEFT JOIN returns all records from the left table and matching records from the right table.

## Real job use

LEFT JOIN is used when we want to keep all main records, even if related data is missing.

Examples:

- Show all properties, even if owner is missing.
- Show all users, even if they have zero properties.
- Show all orders, even if payment is pending.
- Show all customers, even if they have no bookings.

## Important points

1. LEFT JOIN keeps all rows from the left table.
2. Missing right table values become NULL.
3. Use COALESCE to replace NULL with readable text.
4. Filtering the right table in WHERE can make LEFT JOIN behave like INNER JOIN.
5. LEFT JOIN is useful for reports and admin dashboards.

## Interview answer

LEFT JOIN returns all records from the left table and matching records from the right table. If there is no matching record, the right table columns return NULL. For example, in a real estate system, LEFT JOIN can show all properties even if some properties do not have assigned owners..