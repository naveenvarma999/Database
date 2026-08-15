# Day 50 - FastAPI Search API

## What I learned

A search API lets users search records using a keyword.

## Example

/properties/search/?keyword=villa

This searches property title, city, and status.

## Important concepts

ILIKE means case-insensitive search.

or_() is used for OR conditions in SQLAlchemy.

Pagination can also be used with search results.

## SQL meaning

WHERE title ILIKE '%villa%'
OR city ILIKE '%villa%'
OR status ILIKE '%villa%'

## Important route order

/properties/search/ should be placed before /properties/{property_id}

Otherwise FastAPI may treat search as property_id.

## Main memory

Search API = keyword search across multiple columns.