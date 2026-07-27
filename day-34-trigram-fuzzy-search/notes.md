# Day 34 - Trigram / Fuzzy Search

## What I learned

Trigram search is used for fuzzy search.

Fuzzy search helps find results even when the user types spelling mistakes.

## Simple meaning

Fuzzy search = search with spelling mistakes

## Important extension

pg_trgm is a PostgreSQL extension used for trigram search.

## Important functions/operators

similarity() gives a similarity score.
% checks whether two texts are similar enough.
GIN index with gin_trgm_ops helps make trigram search faster.

## Real examples

luxry vila can match Luxury Villa.
manchster can match Manchester.
apartmnt can match Apartment.

## Full-text search vs Trigram search

Full-text search is good for searching words.
Trigram search is good for spelling mistakes and similar text.

## Interview answer

Trigram search in PostgreSQL is used for fuzzy text matching. It is useful when users type spelling mistakes. PostgreSQL provides the pg_trgm extension, similarity function, and % operator for fuzzy matching. A GIN index with gin_trgm_ops can improve trigram search performance.