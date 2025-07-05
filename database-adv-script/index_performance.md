
alx-airbnb-database: Advanced Database Scripting
Directory: database-adv-script
This directory contains advanced SQL scripts for the alx-airbnb-database project, focusing on complex query operations and database manipulation.

File: database_index.sql
This SQL file contains CREATE INDEX commands designed to improve the performance of frequently executed queries by optimizing data retrieval from the users, bookings, properties, and reviews tables. Indexes are created on columns that are commonly used in WHERE clauses, JOIN conditions, and ORDER BY clauses.

Implemented Indexes:
idx_bookings_user_id: An index on the user_id column in the bookings table. This is beneficial for queries that join bookings with users or filter bookings by a specific user.

idx_bookings_property_id: An index on the property_id column in the bookings table. This helps optimize queries that join bookings with properties or aggregate bookings per property.

idx_reviews_property_id: An index on the property_id column in the reviews table. This is useful for queries that join reviews with properties or calculate aggregate statistics (like average rating) for properties.

File: index_performance.md
This document outlines the process of measuring query performance before and after applying database indexes. Understanding the impact of indexes is crucial for effective database optimization.

Measuring Query Performance
To measure query performance, you can use database-specific commands like EXPLAIN (or EXPLAIN ANALYZE in PostgreSQL) to view the query execution plan and identify bottlenecks.

Steps to Measure Performance:
Run a Query Without Indexes (Baseline):
Execute a complex query (e.g., one of the join or subquery examples) before creating any new indexes. Prefix your query with EXPLAIN (or EXPLAIN ANALYZE for PostgreSQL) to see its execution plan.

Example (MySQL/SQLite):

EXPLAIN SELECT
    p.id AS property_id,
    p.name AS property_name,
    p.price_per_night
FROM
    properties AS p
WHERE
    p.id IN (
        SELECT
            r.property_id
        FROM
            reviews AS r
        GROUP BY
            r.property_id
        HAVING
            AVG(r.rating) > 4.0
    );

Example (PostgreSQL):

EXPLAIN ANALYZE SELECT
    p.id AS property_id,
    p.name AS property_name,
    p.price_per_night
FROM
    properties AS p
WHERE
    p.id IN (
        SELECT
            r.property_id
        FROM
            reviews AS r
        GROUP BY
            r.property_id
        HAVING
            AVG(r.rating) > 4.0
    );

Analyze the Output: Look for "Full Table Scans," "Temporary Tables," "Filesort," and the execution time (if using ANALYZE). These often indicate areas for optimization.

Create Indexes:
Execute the CREATE INDEX commands from the database_index.sql file.

-- Example from database_index.sql
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_reviews_property_id ON reviews (property_id);

Run the Same Query With Indexes:
Execute the exact same query again, prefixed with EXPLAIN (or EXPLAIN ANALYZE).

Example (MySQL/SQLite):

EXPLAIN SELECT
    p.id AS property_id,
    p.name AS property_name,
    p.price_per_night
FROM
    properties AS p
WHERE
    p.id IN (
        SELECT
            r.property_id
        FROM
            reviews AS r
        GROUP BY
            r.property_id
        HAVING
            AVG(r.rating) > 4.0
    );

Example (PostgreSQL):

EXPLAIN ANALYZE SELECT
    p.id AS property_id,
    p.name AS property_name,
    p.price_per_night
FROM
    properties AS p
WHERE
    p.id IN (
        SELECT
            r.property_id
        FROM
            reviews AS r
        GROUP BY
            r.property_id
        HAVING
            AVG(r.rating) > 4.0
    );

Compare Outputs: Observe the changes in the execution plan. You should see "Index Scans" or "Index Seeks" instead of full table scans, and potentially a reduction in execution time and resource usage.

By following these steps, you can empirically demonstrate the performance improvements gained by strategically adding indexes to your database tables.
