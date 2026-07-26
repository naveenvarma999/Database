# Day 33 - Full-Text Search in PostgreSQL

## What I learned

Full-text search is used to search words inside text columns like title and description.

## Simple meaning

Full-text search = advanced word search inside database text

## LIKE vs ILIKE

LIKE is case-sensitive.

ILIKE is case-insensitive.

## Important full-text search parts

to_tsvector converts table text into searchable format.

plainto_tsquery converts user search words into search query format.

@@ checks whether searchable text matches the search query.

ts_rank gives a ranking score for matched rows.

GIN index helps make full-text search faster.

## Real job use

In a real estate app, full-text search can be used to search properties by words like luxury, villa, garden, parking, furnished, apartment, or nearby station.

## Interview answer

Full-text search in PostgreSQL is used to search natural language text efficiently. It uses to_tsvector to convert text into searchable tokens and tsquery to search those tokens. The @@ operator checks whether the text matches the query. A GIN index can be used to improve full-text search performance.