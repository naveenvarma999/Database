# Day 29 - EXPLAIN ANALYZE and Query Optimization

## What I learned

EXPLAIN ANALYZE shows how PostgreSQL runs a query.

It helps check whether the query is using full table scan or index scan.

## Simple meaning

EXPLAIN ANALYZE = show query execution details

## Important words

Seq Scan means PostgreSQL is scanning the table row by row.

Index Scan means PostgreSQL is using an index.

Bitmap Index Scan means PostgreSQL used the index to find matching rows.

Filter means the WHERE condition used.

actual time means real execution time.

rows means number of rows processed.

## Why indexes are useful

Indexes help PostgreSQL find data faster for WHERE, JOIN, and ORDER BY queries.

## Important note

Small tables may still use Seq Scan because scanning a small table can be faster than using an index.

## Query optimization rules

1. Use WHERE conditions properly.
2. Create indexes on frequently searched columns.
3. Avoid creating indexes on every column.
4. Avoid SELECT * when only few columns are needed.
5. Use EXPLAIN ANALYZE to check performance.

## Interview answer

EXPLAIN ANALYZE is used to inspect how PostgreSQL executes a query. It shows the query plan, scan type, rows processed, and real execution time. It helps identify slow queries and check whether indexes are being used.