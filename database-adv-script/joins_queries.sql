-- Active: 1752787685050@@127.0.0.1@5432@airbnb
SELECT
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM booking b
INNER JOIN "user" u ON b.user_id = u.user_id;

SELECT
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM property p
LEFT JOIN review r ON p.property_id = r.property_id;

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM "user" u
FULL OUTER JOIN booking b ON u.user_id = b.user_id;
