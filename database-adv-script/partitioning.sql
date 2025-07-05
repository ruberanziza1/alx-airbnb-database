-- This file contains SQL commands for implementing table partitioning
-- on the 'bookings' table within the alx-airbnb-database project,
-- specifically for the database-adv-script directory.

-- Note: The syntax for table partitioning can vary significantly between database systems (e.g., MySQL, PostgreSQL, SQL Server).
-- This example uses MySQL-like syntax for RANGE partitioning.
-- For other database systems, the syntax would need to be adjusted accordingly.

-- Assume the original 'bookings' table exists.
-- Before creating a partitioned table, you might want to back up your data or rename the existing table.
-- For demonstration, we'll create a new partitioned table named 'bookings_partitioned'.

-- Step 1: Create the new partitioned 'bookings_partitioned' table.
-- We will partition by 'start_date' into ranges, typically by year or by specific date intervals.
-- This example partitions by year, assuming bookings are primarily queried by date ranges.

CREATE TABLE bookings_partitioned (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id, start_date) -- Primary key must include all columns used in partitioning
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p0 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE -- Catch-all partition for future dates
);

-- Step 2: (Optional) Migrate existing data from the original 'bookings' table to 'bookings_partitioned'.
-- This step would be performed after creating the partitioned table.
-- INSERT INTO bookings_partitioned
-- SELECT * FROM bookings;

-- Step 3: (Optional) Drop the original 'bookings' table after successful migration.
-- DROP TABLE bookings;

-- Example Queries to test partitioning performance:
-- These queries would typically be run in your database client with EXPLAIN/EXPLAIN ANALYZE
-- to observe partition pruning.

-- Query 1: Fetch bookings within a specific year (should hit only one partition)
-- EXPLAIN SELECT *
-- FROM bookings_partitioned
-- WHERE start_date >= '2023-01-01' AND start_date < '2024-01-01';

-- Query 2: Fetch bookings spanning multiple years (should hit multiple, but not all, partitions)
-- EXPLAIN SELECT *
-- FROM bookings_partitioned
-- WHERE start_date >= '2022-06-01' AND start_date < '2024-06-01';

-- Query 3: Fetch a single booking by ID (still uses primary key lookup, but partitioning adds overhead if PK is not part of partition key)
-- EXPLAIN SELECT *
-- FROM bookings_partitioned
-- WHERE id = 123 AND start_date = '2023-03-15'; -- start_date is needed if it's part of the PK

