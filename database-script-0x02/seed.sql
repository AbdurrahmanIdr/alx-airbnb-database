-- Insert Users
INSERT INTO user (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('1e0d62f3-9d25-4cf4-8a5a-aaaa00000001', 'Chinaza', 'Okafor', 'chinaza.okafor@example.com', 'hashed_pass1', '08034567890', 'guest'),
  ('1e0d62f3-9d25-4cf4-8a5a-aaaa00000002', 'Tunde', 'Adeyemi', 'tunde.adeyemi@example.com', 'hashed_pass2', '08091234567', 'host'),
  ('1e0d62f3-9d25-4cf4-8a5a-aaaa00000003', 'Zainab', 'Bello', 'zainab.bello@example.com', 'hashed_pass3', '08123456789', 'guest'),
  ('1e0d62f3-9d25-4cf4-8a5a-aaaa00000004', 'Emeka', 'Nwosu', 'emeka.nwosu@example.com', 'hashed_pass4', '08067891234', 'host');

-- Insert Properties
INSERT INTO property (property_id, host_id, name, description, location, price_per_night)
VALUES
  ('2b0d62f3-9d25-4cf4-8a5a-bbbb00000001', '1e0d62f3-9d25-4cf4-8a5a-aaaa00000002', 'Lekki Luxury Apartment', 'A 2-bedroom serviced apartment in Lekki Phase 1.', 'Lekki, Lagos', 45000.00),
  ('2b0d62f3-9d25-4cf4-8a5a-bbbb00000002', '1e0d62f3-9d25-4cf4-8a5a-aaaa00000004', 'Abuja Garden Suite', 'Modern suite close to Jabi Lake Mall.', 'Jabi, Abuja', 30000.00);

-- Insert Bookings
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('3c0d62f3-9d25-4cf4-8a5a-cccc00000001', '2b0d62f3-9d25-4cf4-8a5a-bbbb00000001', '1e0d62f3-9d25-4cf4-8a5a-aaaa00000001', '2025-07-01', '2025-07-03', 90000.00, 'confirmed'),
  ('3c0d62f3-9d25-4cf4-8a5a-cccc00000002', '2b0d62f3-9d25-4cf4-8a5a-bbbb00000002', '1e0d62f3-9d25-4cf4-8a5a-aaaa00000003', '2025-07-05', '2025-07-06', 30000.00, 'pending');

-- Insert Payments
INSERT INTO payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('4d0d62f3-9d25-4cf4-8a5a-dddd00000001', '3c0d62f3-9d25-4cf4-8a5a-cccc00000001', 90000.00, 'stripe'),
  ('4d0d62f3-9d25-4cf4-8a5a-dddd00000002', '3c0d62f3-9d25-4cf4-8a5a-cccc00000002', 30000.00, 'paypal');

-- Insert Reviews
INSERT INTO review (review_id, property_id, user_id, rating, comment)
VALUES
  ('5e0d62f3-9d25-4cf4-8a5a-eeee00000001', '2b0d62f3-9d25-4cf4-8a5a-bbbb00000001', '1e0d62f3-9d25-4cf4-8a5a-aaaa00000001', 5, 'Fantastic place! Very neat and comfortable.'),
  ('5e0d62f3-9d25-4cf4-8a5a-eeee00000002', '2b0d62f3-9d25-4cf4-8a5a-bbbb00000002', '1e0d62f3-9d25-4cf4-8a5a-aaaa00000003', 4, 'Nice location and responsive host.');

-- Insert Messages
INSERT INTO message (message_id, sender_id, receiver_id, message_body)
VALUES
  ('6f0d62f3-9d25-4cf4-8a5a-ffff00000001', '1e0d62f3-9d25-4cf4-8a5a-aaaa00000001', '1e0d62f3-9d25-4cf4-8a5a-aaaa00000002', 'Hello, I would like to confirm the check-in time.'),
  ('6f0d62f3-9d25-4cf4-8a5a-ffff00000002', '1e0d62f3-9d25-4cf4-8a5a-aaaa00000002', '1e0d62f3-9d25-4cf4-8a5a-aaaa00000001', 'Check-in is available from 2PM. Looking forward to hosting you!');
