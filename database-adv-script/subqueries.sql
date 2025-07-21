-- 1. Properties where average rating is greater than 4.0
SELECT *
FROM property
WHERE property_id IN (
    SELECT property_id
    FROM review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- 2. Users who have made more than 3 bookings (correlated subquery)
SELECT user_id, first_name, last_name
FROM "user" u
WHERE (
    SELECT COUNT(*)
    FROM booking b
    WHERE b.user_id = u.user_id
) > 3;
