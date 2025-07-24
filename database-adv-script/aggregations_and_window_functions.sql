-- Total number of bookings made by each user
SELECT u.user_id,
       COUNT(b.booking_id) AS total_booking
FROM "user" u
JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id;

-- Ranking properties by the number of bookings (using window functions)
WITH property_count AS (
    SELECT p.property_id,
           COUNT(b.booking_id) AS total_booking
    FROM property p
    LEFT JOIN booking b ON p.property_id = b.property_id
    GROUP BY p.property_id
)
SELECT property_id,
       total_booking,
       ROW_NUMBER() OVER (ORDER BY total_booking DESC) AS row_num,
       RANK() OVER (ORDER BY total_booking DESC) AS rank_num
FROM property_count;
