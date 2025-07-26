-- Create indexes to optimize frequent join and filter operations

-- Index on user_id in 'user' table (frequently joined)
CREATE INDEX idx_user_user_id ON "user" (user_id);

-- Index on user_id in 'booking' table (frequent joins and filters)
CREATE INDEX idx_booking_user_id ON booking (user_id);

-- Index on property_id in 'booking' table (for join with property)
CREATE INDEX idx_booking_property_id ON booking (property_id);

-- Index on property_id in 'property' table
CREATE INDEX idx_property_property_id ON property (property_id);

-- Index on property_id in 'review' table (for left joins with review)
CREATE INDEX idx_review_property_id ON review (property_id);

-- Performance analysis using EXPLAIN ANALYZE

-- Test query performance for user bookings join (benefits from idx_booking_user_id)
EXPLAIN
ANALYZE
SELECT u.user_id, u.first_name, u.last_name, b.booking_id, b.start_date, b.end_date
FROM "user" u
    JOIN booking b ON u.user_id = b.user_id
WHERE
    u.user_id = 'specific-user-id';

-- Test query performance for property bookings join (benefits from idx_booking_property_id)
EXPLAIN
ANALYZE
SELECT p.property_id, p.name, p.location, b.booking_id, b.start_date, b.end_date
FROM property p
    JOIN booking b ON p.property_id = b.property_id
WHERE
    p.property_id = 'specific-property-id';

-- Test query performance for property reviews join (benefits from idx_review_property_id)
EXPLAIN
ANALYZE
SELECT p.property_id, p.name, r.review_id, r.rating, r.comment
FROM property p
    LEFT JOIN review r ON p.property_id = r.property_id
WHERE
    p.property_id = 'specific-property-id';

-- Complex query with multiple joins to test combined index performance
EXPLAIN
ANALYZE
SELECT u.first_name, u.last_name, p.name AS property_name, p.location, b.start_date, b.end_date, r.rating, r.comment
FROM
    "user" u
    JOIN booking b ON u.user_id = b.user_id
    JOIN property p ON b.property_id = p.property_id
    LEFT JOIN review r ON p.property_id = r.property_id
WHERE
    u.user_id = 'specific-user-id'
ORDER BY b.start_date DESC;
