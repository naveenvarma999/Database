# Day 30 - VACUUM, ANALYZE, and Table Maintenance

## What I learned

VACUUM cleans dead row versions from a table.

ANALYZE updates table statistics.

PostgreSQL uses statistics to choose the best query plan.

## Simple meaning

VACUUM = clean dead rows

ANALYZE = update statistics

VACUUM ANALYZE = clean dead rows and update statistics

## Why dead rows happen

PostgreSQL uses MVCC.

When rows are updated or deleted, old row versions can remain for some time.

These old unused versions are called dead rows.

## pg_stat_user_tables

This PostgreSQL system view shows table statistics.

Important columns:

n_live_tup = estimated live rows

n_dead_tup = estimated dead rows

last_vacuum = last manual vacuum

last_autovacuum = last automatic vacuum

last_analyze = last manual analyze

last_autoanalyze = last automatic analyze

## ANALYZE vs EXPLAIN ANALYZE

ANALYZE table_name updates table statistics.

EXPLAIN ANALYZE SELECT ... shows how PostgreSQL runs a query.

## VACUUM FULL

VACUUM FULL rewrites the table and can free disk space.

But it locks the table, so it should not be used casually.

## Interview answer

VACUUM is used to clean dead row versions created by updates and deletes. ANALYZE updates table statistics so PostgreSQL can choose better query plans. VACUUM ANALYZE performs both cleanup and statistics update. PostgreSQL also has autovacuum, which runs automatically in the background.