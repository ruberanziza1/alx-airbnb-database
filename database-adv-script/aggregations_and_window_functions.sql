-- This file contains SQL queries demonstrating aggregation and window functions
-- as part of the alx-airbnb-database project, specifically for the
-- database-adv-script directory.

-- 1. Query to find the total number of bookings made by each user,
--    using the COUNT function and GROUP BY clause.
SELECT
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM
    users AS u
LEFT JOIN
    bookings AS b ON u.id = b.user_id
GROUP BY
    u.id, u.name
ORDER BY
    total_bookings DESC, u.name;

-- 2. Use a window function (ROW_NUMBER, RANK) to rank properties
--    based on the total number of bookings they have received.
--    This query first calculates the total bookings for each property
--    and then applies the RANK() window function to assign a rank.
SELECT
    property_id,
    property_name,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT
        p.id AS property_id,
        p.name AS property_name,
        COUNT(b.id) AS total_bookings
    FROM
        properties AS p
    LEFT JOIN
        bookings AS b ON p.id = b.property_id
    GROUP BY
        p.id, p.name
) AS property_booking_counts
ORDER BY
    booking_rank, property_id;

