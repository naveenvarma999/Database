# Day 15 - Subqueries in PostgreSQL

## What I learned

A subquery is a query inside another query.

Subqueries are useful when one query depends on the result of another query.

## Examples

- Properties above average price
- Properties below average price
- Most expensive property
- Cheapest property
- Users who saved properties
- Properties saved by users
- Properties not saved by anyone
- Users who own properties

## Types of subqueries practised

- Single-row subquery
- Multi-row subquery
- Subquery with IN
- Subquery with NOT IN
- Subquery in SELECT
- Subquery in FROM
- Correlated subquery

## Important rules

1. Subqueries must be written inside parentheses.
2. Use = when the subquery returns one value.
3. Use IN when the subquery returns multiple values.
4. Use NOT IN carefully when NULL values are possible.
5. Use JOIN when you need columns from multiple tables.
6. Use subquery when you need to filter based on another query result.

## Subquery vs JOIN

JOIN is better when we need data from both tables.

Subquery is useful when we only need to filter using the result of another query.

## Interview answer

A subquery is a query written inside another query. It is used when the result of one query is needed by another query. For example, we can use a subquery to find properties whose price is greater than the average property price.