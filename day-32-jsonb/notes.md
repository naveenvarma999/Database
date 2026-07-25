# Day 32 - JSONB in PostgreSQL

## What I learned

JSONB is used to store flexible JSON data inside PostgreSQL.

## Simple meaning

JSONB = flexible data storage

## Why JSONB is useful

JSONB is useful when some data is not fixed for every row.

Examples:

- amenities
- settings
- filters
- preferences
- extra property details
- metadata

## Important operators

-> gets JSON value.

->> gets JSON value as text.

? checks whether an array or object contains a key/value.

@> checks whether JSONB contains another JSONB structure.

## JSONB index

GIN index helps speed up JSONB search.

## Important rule

Fixed important data should be normal columns.

Flexible extra data can be JSONB.

## Interview answer

JSONB is a PostgreSQL data type used to store JSON data in a binary format. It is useful for flexible or semi-structured data. JSONB supports indexing and efficient searching using operators like ->, ->>, ?, and @>.