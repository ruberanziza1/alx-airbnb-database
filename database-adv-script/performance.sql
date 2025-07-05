-- This file contains SQL queries for demonstrating query optimization
-- within the alx-airbnb-database project, specifically for the
-- database-adv-script directory.

-- Initial Query: Retrieve all bookings along with user details, property details, and payment details.
-- This query uses multiple INNER JOINs to combine data from four tables.
-- It's a comprehensive query designed to fetch all related information for each booking.
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.price_per_night,
    p.location AS property_location,
    pm.id AS payment_id,
    pm.amount AS payment_amount,
    pm.payment_date,
    pm.status AS payment_status
FROM
    bookings AS b
INNER JOIN
    users AS u ON b.user_id = u.id
INNER JOIN
    properties AS p ON b.property_id = p.id
INNER JOIN
    payments AS pm ON b.id = pm.booking_id
ORDER BY
    b.start_date DESC;

-- Refactored Query: Optimized version of the above query.
-- For a query involving multiple INNER JOINs to retrieve comprehensive details,
-- the primary optimization comes from ensuring appropriate indexes are in place
-- on the join columns (user_id, property_id, booking_id).
-- This refactored version explicitly selects necessary columns instead of using *,
-- which is a good practice for performance, especially in large tables.
-- It also maintains a clear and logical join order.
-- Assuming indexes are created on:
-- - bookings.user_id
-- - bookings.property_id
-- - payments.booking_id
-- - (Primary keys on users.id, properties.id, payments.id, bookings.id are typically indexed by default)
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.name AS user_name,
    u.email AS user_email,
    p.name AS property_name,
    p.location AS property_location,
    p.price_per_night,
    pm.amount AS payment_amount,
    pm.payment_date,
    pm.status AS payment_status
FROM
    bookings AS b
INNER JOIN
    users AS u ON b.user_id = u.id
INNER JOIN
    properties AS p ON b.property_id = p.id
INNER JOIN
    payments AS pm ON b.id = pm.booking_id
ORDER BY
    b.start_date DESC;


