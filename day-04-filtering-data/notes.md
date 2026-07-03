# Day 4 - Filtering Data

## What I learned

Filtering means getting only the required records from a table.

In SQL, filtering is mainly done using the WHERE clause.

## Important operators

- WHERE: filters records
- AND: all conditions must be true
- OR: any one condition can be true
- IN: checks multiple values
- NOT IN: excludes multiple values
- BETWEEN: filters values in a range
- LIKE: pattern matching
- ILIKE: case-insensitive pattern matching in PostgreSQL
- IS NULL: checks missing values
- IS NOT NULL: checks available values

## Real job examples

- Search properties by city
- Search properties by price range
- Search available properties
- Search featured properties
- Search by property type
- Search users by email domain

## Important rules

1. Use WHERE to filter data.
2. Use AND when all conditions must match.
3. Use OR when any condition can match.
4. Use brackets when combining AND and OR.
5. Use IN instead of many OR conditions.
6. Use BETWEEN for ranges.
7. Use ILIKE in PostgreSQL for case-insensitive search.
8. Use IS NULL instead of = NULL.

## Interview answer

Filtering in SQL is used to retrieve only the required data from a table. The WHERE clause is used with operators like AND, OR, IN, BETWEEN, LIKE, ILIKE, IS NULL, and comparison operators. In real applications, filtering is used for search features, dashboards, reports, and admin panels.