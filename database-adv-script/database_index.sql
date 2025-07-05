-- This file contains SQL CREATE INDEX commands for optimizing query performance
-- within the alx-airbnb-database project, specifically for the
-- database-adv-script directory.

-- Identifying high-usage columns based on previous queries (joins, subqueries, aggregations):
-- - users.id: Used in JOINs, WHERE clauses, and GROUP BY. Primary key, often implicitly indexed.
-- - bookings.user_id: Used in JOINs (INNER, LEFT, FULL OUTER), WHERE clauses (correlated subquery), GROUP BY.
-- - bookings.property_id: Used in JOINs (LEFT), GROUP BY.
-- - properties.id: Used in JOINs, WHERE clauses (subquery). Primary key, often implicitly indexed.
-- - reviews.property_id: Used in JOINs (LEFT), GROUP BY (subquery).
-- - users.email: Often used for login/lookup, good candidate for a unique index if emails are unique.

-- Create index on bookings.user_id:
-- This column is frequently used in JOIN conditions and WHERE clauses
-- when linking bookings to users, and in GROUP BY for user-specific aggregations.
CREATE INDEX idx_bookings_user_id ON bookings (user_id);

-- Create index on bookings.property_id:
-- This column is frequently used in JOIN conditions when linking bookings to properties,
-- and in GROUP BY for property-specific aggregations.
CREATE INDEX idx_bookings_property_id ON bookings (property_id);

-- Create index on reviews.property_id:
-- This column is crucial for joining reviews with properties and for grouping
-- reviews to calculate average ratings.
CREATE INDEX idx_reviews_property_id ON reviews (property_id);

-- Optional: Create a unique index on users.email if it's used for unique identification
-- and frequent lookups (e.g., login).
-- Note: Ensure email values are unique before creating a unique index.
-- CREATE UNIQUE INDEX idx_users_email ON users (email);

-- Optional: Create indexes on columns used in ORDER BY clauses if they are not already covered
-- by primary keys or other indexes.
-- For example, if you frequently order properties by price_per_night:
-- CREATE INDEX idx_properties_price_per_night ON properties (price_per_night);

