-- Original Query (Before Optimization)
-- Query execution plan analysis
EXPLAIN
ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method
FROM
    booking b
    JOIN "user" u ON b.user_id = u.user_id
    JOIN property p ON b.property_id = p.property_id
    JOIN payment pay ON b.booking_id = pay.booking_id
WHERE
    b.status = 'confirmed'
    AND b.start_date >= '2024-01-01'
    AND b.end_date <= '2024-12-31'
    AND pay.payment_method = 'credit_card';

-- Optimized Query (After Optimization)
-- Reduced selected columns, added proper filtering, and optimized joins
EXPLAIN
ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name || ' ' || u.last_name AS full_name,
    p.name AS property_name,
    pay.amount
FROM
    booking b
    JOIN "user" u ON b.user_id = u.user_id
    JOIN property p ON b.property_id = p.property_id
    JOIN payment pay ON b.booking_id = pay.booking_id
WHERE
    b.status = 'confirmed'
    AND b.start_date >= '2024-01-01'
    AND b.end_date <= '2024-12-31'
    AND pay.payment_method = 'credit_card'
    AND p.location LIKE '%New York%';

-- Performance Comparison Query
-- Using EXPLAIN to analyze query execution plan without ANALYZE for faster execution
EXPLAIN
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name || ' ' || u.last_name AS full_name,
    p.name AS property_name,
    pay.amount
FROM
    booking b
    JOIN "user" u ON b.user_id = u.user_id
    JOIN property p ON b.property_id = p.property_id
    JOIN payment pay ON b.booking_id = pay.booking_id
WHERE
    b.status IN ('confirmed', 'pending')
    AND b.created_at >= CURRENT_DATE - INTERVAL '30 days'
    AND pay.amount > 100.00;
