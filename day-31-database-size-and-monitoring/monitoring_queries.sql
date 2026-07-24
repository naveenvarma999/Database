-- Day 31: Database Size and Monitoring in PostgreSQL

-- 1. Check daydream_db size
SELECT pg_size_pretty(pg_database_size('daydream_db')) AS database_size;


-- 2. Check all database sizes
SELECT 
    datname AS database_name,
    pg_size_pretty(pg_database_size(datname)) AS database_size
FROM pg_database
ORDER BY pg_database_size(datname) DESC;


-- 3. Check total size of properties table
SELECT pg_size_pretty(pg_total_relation_size('properties')) AS properties_total_size;


-- 4. Check only table data size
SELECT pg_size_pretty(pg_relation_size('properties')) AS properties_table_size;


-- 5. Check all table sizes
SELECT 
    relname AS table_name,
    pg_size_pretty(pg_total_relation_size(relid)) AS total_size,
    pg_size_pretty(pg_relation_size(relid)) AS table_size
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC;


-- 6. Check index and extra size for properties table
SELECT 
    pg_size_pretty(
        pg_total_relation_size('properties') - pg_relation_size('properties')
    ) AS index_and_extra_size;


-- 7. Check active connections
SELECT 
    pid,
    usename AS username,
    datname AS database_name,
    state,
    query
FROM pg_stat_activity
WHERE datname = 'daydream_db';


-- 8. Check long-running active queries
SELECT 
    pid,
    usename,
    datname,
    state,
    now() - query_start AS running_time,
    query
FROM pg_stat_activity
WHERE state = 'active'
ORDER BY running_time DESC;


-- 9. Check estimated live and dead rows
SELECT 
    relname AS table_name,
    n_live_tup AS estimated_live_rows,
    n_dead_tup AS estimated_dead_rows
FROM pg_stat_user_tables
ORDER BY n_live_tup DESC;


-- 10. Real monitoring query
SELECT 
    relname AS table_name,
    n_live_tup AS live_rows,
    n_dead_tup AS dead_rows,
    pg_size_pretty(pg_total_relation_size(relid)) AS total_size,
    last_vacuum,
    last_autovacuum,
    last_analyze,
    last_autoanalyze
FROM pg_stat_user_tables
ORDER BY pg_total_relation_size(relid) DESC;