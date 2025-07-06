-- Create User Table
CREATE TABLE IF NOT EXISTS user (
    user_id CHAR(36) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX (email)
);

-- Trigger to auto-generate UUID for user
DELIMITER //
CREATE TRIGGER before_insert_user
BEFORE INSERT ON user
FOR EACH ROW
BEGIN
  IF NEW.user_id IS NULL OR NEW.user_id = '' THEN
    SET NEW.user_id = UUID();
  END IF;
END;
//
DELIMITER ;

-- Create Property Table
CREATE TABLE IF NOT EXISTS property (
    property_id CHAR(36) PRIMARY KEY,
    host_id CHAR(36) NOT NULL,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(100) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES user(user_id) ON DELETE CASCADE,
    INDEX (property_id)
);

-- Trigger for property
DELIMITER //
CREATE TRIGGER before_insert_property
BEFORE INSERT ON property
FOR EACH ROW
BEGIN
  IF NEW.property_id IS NULL OR NEW.property_id = '' THEN
    SET NEW.property_id = UUID();
  END IF;
END;
//
DELIMITER ;

-- Create Booking Table
CREATE TABLE IF NOT EXISTS booking (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    INDEX (property_id),
    INDEX (booking_id)
);

-- Trigger for booking
DELIMITER //
CREATE TRIGGER before_insert_booking
BEFORE INSERT ON booking
FOR EACH ROW
BEGIN
  IF NEW.booking_id IS NULL OR NEW.booking_id = '' THEN
    SET NEW.booking_id = UUID();
  END IF;
END;
//
DELIMITER ;

-- Create Payment Table
CREATE TABLE IF NOT EXISTS payment (
    payment_id CHAR(36) PRIMARY KEY,
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id) ON DELETE CASCADE,
    INDEX (booking_id)
);

-- Trigger for payment
DELIMITER //
CREATE TRIGGER before_insert_payment
BEFORE INSERT ON payment
FOR EACH ROW
BEGIN
  IF NEW.payment_id IS NULL OR NEW.payment_id = '' THEN
    SET NEW.payment_id = UUID();
  END IF;
END;
//
DELIMITER ;

-- Create Review Table
CREATE TABLE IF NOT EXISTS review (
    review_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

-- Trigger for review
DELIMITER //
CREATE TRIGGER before_insert_review
BEFORE INSERT ON review
FOR EACH ROW
BEGIN
  IF NEW.review_id IS NULL OR NEW.review_id = '' THEN
    SET NEW.review_id = UUID();
  END IF;
END;
//
DELIMITER ;

-- Create Message Table
CREATE TABLE IF NOT EXISTS message (
    message_id CHAR(36) PRIMARY KEY,
    sender_id CHAR(36) NOT NULL,
    receiver_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES user(user_id) ON DELETE CASCADE
);

-- Trigger for message
DELIMITER //
CREATE TRIGGER before_insert_message
BEFORE INSERT ON message
FOR EACH ROW
BEGIN
  IF NEW.message_id IS NULL OR NEW.message_id = '' THEN
    SET NEW.message_id = UUID();
  END IF;
END;
//
DELIMITER ;
