-- This file contains SQL queries demonstrating various types of joins
-- as part of the alx-airbnb-database project, specifically for the
-- database-adv-script directory.

-- 1. Query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
--    This query will only return rows where there is a match in both the 'users' and 'bookings' tables,
--    meaning only bookings that are linked to an existing user.
SELECT
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.property_id,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email
FROM
    bookings AS b
INNER JOIN
    users AS u ON b.user_id = u.id;

-- 2. Query using a LEFT JOIN to retrieve all properties and their reviews,
--    including properties that have no reviews.
--    This query will return all properties from the 'properties' table
--    and any matching reviews from the 'reviews' table. If a property
--    has no reviews, the review-related columns will show NULL.
SELECT
    p.id AS property_id,
    p.name AS property_name,
    p.price_per_night,
    r.id AS review_id,
    r.rating,
    r.comment,
    r.user_id AS reviewer_user_id
FROM
    properties AS p
LEFT JOIN
    reviews AS r ON p.id = r.property_id
ORDER BY
    p.id, r.id; -- Added ORDER BY clause to sort by property ID and then by review ID

-- 3. Query using a FULL OUTER JOIN to retrieve all users and all bookings,
--    even if the user has no booking or a booking is not linked to a user.
--    Note: MySQL does not directly support FULL OUTER JOIN. A common workaround
--    is to use a UNION of LEFT JOIN and RIGHT JOIN.
--    This example assumes a database system that supports FULL OUTER JOIN (e.g., PostgreSQL, SQL Server).
--    If using MySQL, the commented-out UNION alternative is provided below.

-- For databases supporting FULL OUTER JOIN (e.g., PostgreSQL, SQL Server):
SELECT
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    b.property_id
FROM
    users AS u
FULL OUTER JOIN
    bookings AS b ON u.id = b.user_id;

-- For MySQL (simulating FULL OUTER JOIN using UNION):
-- SELECT
--     u.id AS user_id,
--     u.name AS user_name,
--     u.email AS user_email,
--     b.id AS booking_id,
--     b.start_date,
--     b.end_date,
--     b.property_id
-- FROM
--     users AS u
-- LEFT JOIN
--     bookings AS b ON u.id = b.user_id
-- UNION
-- SELECT
--     u.id AS user_id,
--     u.name AS user_name,
--     u.email AS user_email,
--     b.id AS booking_id,
--     b.start_date,
--     b.end_date,
--     b.property_id
-- FROM
--     users AS u
-- RIGHT JOIN
--     bookings AS b ON u.id = b.user_id
-- WHERE
--     u.id IS NULL; -- This condition ensures we only pick bookings not matched by the LEFT JOIN part
