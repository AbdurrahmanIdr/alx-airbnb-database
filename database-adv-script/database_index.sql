-- Create indexes to optimize frequent join and filter operations

-- Index on user_id in 'user' table (frequently joined)
CREATE INDEX idx_user_user_id ON "user"(user_id);

-- Index on user_id in 'booking' table (frequent joins and filters)
CREATE INDEX idx_booking_user_id ON booking(user_id);

-- Index on property_id in 'booking' table (for join with property)
CREATE INDEX idx_booking_property_id ON booking(property_id);

-- Index on property_id in 'property' table
CREATE INDEX idx_property_property_id ON property(property_id);

-- Index on property_id in 'review' table (for left joins with review)
CREATE INDEX idx_review_property_id ON review(property_id);
