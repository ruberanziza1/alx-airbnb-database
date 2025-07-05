-- This file contains SQL queries demonstrating various types of subqueries
-- as part of the alx-airbnb-database project, specifically for the
-- database-adv-script directory.

-- 1. Query to find all properties where the average rating is greater than 4.0 using a subquery.
--    This is a non-correlated subquery because the inner query can be executed
--    independently of the outer query.
SELECT
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

-- 2. Correlated subquery to find users who have made more than 3 bookings.
--    This is a correlated subquery because the inner query depends on the
--    outer query for its execution (it references 'u.id' from the outer query).
SELECT
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email
FROM
    users AS u
WHERE
    (
        SELECT
            COUNT(*)
        FROM
            bookings AS b
        WHERE
            b.user_id = u.id
    ) > 3;

