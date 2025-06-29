-- seed.sql
-- Sample data for Airbnb-like database

-- USERS
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (UUID(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password1', '1234567890', 'guest'),
  (UUID(), 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password2', '2345678901', 'host'),
  (UUID(), 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashed_password3', NULL, 'guest');

-- PROPERTIES
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  (UUID(), 
   (SELECT user_id FROM users WHERE email = 'alice.smith@example.com'), 
   'Cozy Apartment', 
   'A modern apartment in the city center.', 
   'Lagos, Nigeria', 
   30000.00),
   
  (UUID(), 
   (SELECT user_id FROM users WHERE email = 'alice.smith@example.com'), 
   'Beachfront Villa', 
   'Spacious villa with ocean views.', 
   'Lekki, Nigeria', 
   60000.00);

-- BOOKINGS
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (
    UUID(),
    (SELECT property_id FROM properties WHERE name = 'Cozy Apartment'),
    (SELECT user_id FROM users WHERE email = 'john.doe@example.com'),
    '2025-07-01', '2025-07-03',
    60000.00, 'confirmed'
  ),
  (
    UUID(),
    (SELECT property_id FROM properties WHERE name = 'Beachfront Villa'),
    (SELECT user_id FROM users WHERE email = 'bob.johnson@example.com'),
    '2025-07-10', '2025-07-13',
    180000.00, 'pending'
  );

-- PAYMENTS
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  (
    UUID(),
    (SELECT booking_id FROM bookings WHERE total_price = 60000.00),
    60000.00,
    'credit_card'
  );

-- REVIEWS
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  (
    UUID(),
    (SELECT property_id FROM properties WHERE name = 'Cozy Apartment'),
    (SELECT user_id FROM users WHERE email = 'john.doe@example.com'),
    5,
    'Fantastic location and clean apartment.'
  );

-- MESSAGES
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  (
    UUID(),
    (SELECT user_id FROM users WHERE email = 'john.doe@example.com'),
    (SELECT user_id FROM users WHERE email = 'alice.smith@example.com'),
    'Hi Alice, is the apartment available in August?'
  ),
  (
    UUID(),
    (SELECT user_id FROM users WHERE email = 'alice.smith@example.com'),
    (SELECT user_id FROM users WHERE email = 'john.doe@example.com'),
    'Hi John, yes it is available. You can book anytime.'
  );
