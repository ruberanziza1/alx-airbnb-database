-- ========================================
-- ALX Airbnb Database Schema
-- Task 3: Database Schema Implementation
-- ========================================

-- Create database (optional - uncomment if needed)
-- CREATE DATABASE IF NOT EXISTS airbnb_db;
-- USE airbnb_db;

-- ========================================
-- 1. USER TABLE
-- ========================================
CREATE TABLE User (
    user_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL DEFAULT 'guest',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Constraints
    CONSTRAINT chk_email_format CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    CONSTRAINT chk_phone_format CHECK (phone_number IS NULL OR phone_number REGEXP '^[+]?[0-9]{10,15}$'),
    CONSTRAINT chk_name_length CHECK (LENGTH(first_name) >= 2 AND LENGTH(last_name) >= 2)
);

-- Indexes for User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);
CREATE INDEX idx_user_created_at ON User(created_at);
CREATE INDEX idx_user_name ON User(last_name, first_name);

-- ========================================
-- 2. PROPERTY TABLE
-- ========================================
CREATE TABLE Property (
    property_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    host_id CHAR(36) NOT NULL,
    name VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(300) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Foreign Key Constraints
    CONSTRAINT fk_property_host FOREIGN KEY (host_id) REFERENCES User(user_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    -- Business Logic Constraints
    CONSTRAINT chk_price_positive CHECK (pricepernight > 0),
    CONSTRAINT chk_name_length CHECK (LENGTH(name) >= 3),
    CONSTRAINT chk_description_length CHECK (LENGTH(description) >= 10)
);

-- Indexes for Property table
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);
CREATE INDEX idx_property_created_at ON Property(created_at);
CREATE INDEX idx_property_name ON Property(name);

-- ========================================
-- 3. BOOKING TABLE
-- ========================================
CREATE TABLE Booking (
    booking_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign Key Constraints
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES Property(property_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES User(user_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    -- Business Logic Constraints
    CONSTRAINT chk_booking_dates CHECK (end_date > start_date),
    CONSTRAINT chk_booking_future CHECK (start_date >= CURDATE()),
    CONSTRAINT chk_total_price_positive CHECK (total_price > 0),
    
    -- Unique constraint to prevent double booking
    CONSTRAINT unique_property_dates UNIQUE (property_id, start_date, end_date)
);

-- Indexes for Booking table
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_created_at ON Booking(created_at);
CREATE INDEX idx_booking_property_status ON Booking(property_id, status);

-- ========================================
-- 4. PAYMENT TABLE
-- ========================================
CREATE TABLE Payment (
    payment_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    
    -- Foreign Key Constraints
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    -- Business Logic Constraints
    CONSTRAINT chk_payment_amount_positive CHECK (amount > 0)
);

-- Indexes for Payment table
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
CREATE INDEX idx_payment_date ON Payment(payment_date);
CREATE INDEX idx_payment_method ON Payment(payment_method);
CREATE INDEX idx_payment_amount ON Payment(amount);

-- ========================================
-- 5. REVIEW TABLE
-- ========================================
CREATE TABLE Review (
    review_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INTEGER NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign Key Constraints
    CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES Property(property_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES User(user_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    -- Business Logic Constraints
    CONSTRAINT chk_rating_range CHECK (rating >= 1 AND rating <= 5),
    CONSTRAINT chk_comment_length CHECK (LENGTH(comment) >= 10),
    
    -- Prevent duplicate reviews from same user for same property
    CONSTRAINT unique_user_property_review UNIQUE (property_id, user_id)
);

-- Indexes for Review table
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);
CREATE INDEX idx_review_rating ON Review(rating);
CREATE INDEX idx_review_created_at ON Review(created_at);
CREATE INDEX idx_review_property_rating ON Review(property_id, rating);

-- ========================================
-- 6. MESSAGE TABLE
-- ========================================
CREATE TABLE Message (
    message_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    sender_id CHAR(36) NOT NULL,
    recipient_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign Key Constraints
    CONSTRAINT fk_message_sender FOREIGN KEY (sender_id) REFERENCES User(user_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_message_recipient FOREIGN KEY (recipient_id) REFERENCES User(user_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    
    -- Business Logic Constraints
    CONSTRAINT chk_different_users CHECK (sender_id != recipient_id),
    CONSTRAINT chk_message_length CHECK (LENGTH(message_body) >= 1)
);

-- Indexes for Message table
CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_recipient_id ON Message(recipient_id);
CREATE INDEX idx_message_sent_at ON Message(sent_at);
CREATE INDEX idx_message_conversation ON Message(sender_id, recipient_id, sent_at);

-- ========================================
-- ADDITIONAL PERFORMANCE OPTIMIZATIONS
-- ========================================

-- Composite indexes for common query patterns
CREATE INDEX idx_property_host_price ON Property(host_id, pricepernight);
CREATE INDEX idx_booking_user_status_dates ON Booking(user_id, status, start_date, end_date);
CREATE INDEX idx_review_property_rating_date ON Review(property_id, rating, created_at);

-- ========================================
-- SAMPLE TRIGGERS (Optional Enhancement)
-- ========================================

-- Trigger to automatically update property updated_at timestamp
DELIMITER //
CREATE TRIGGER tr_property_updated_at 
    BEFORE UPDATE ON Property
    FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END//
DELIMITER ;

-- Trigger to prevent booking overlaps (additional validation)
DELIMITER //
CREATE TRIGGER tr_prevent_booking_overlap 
    BEFORE INSERT ON Booking
    FOR EACH ROW
BEGIN
    DECLARE overlap_count INT;
    SELECT COUNT(*) INTO overlap_count
    FROM Booking 
    WHERE property_id = NEW.property_id 
    AND status IN ('pending', 'confirmed')
    AND ((NEW.start_date BETWEEN start_date AND end_date) 
         OR (NEW.end_date BETWEEN start_date AND end_date)
         OR (start_date BETWEEN NEW.start_date AND NEW.end_date));
    
    IF overlap_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Booking dates overlap with existing booking';
    END IF;
END//
DELIMITER ;

-- ========================================
-- COMMENTS AND DOCUMENTATION
-- ========================================

/*
Schema Design Notes:
1. UUID Primary Keys: Using CHAR(36) for UUID storage with DEFAULT (UUID()) for auto-generation
2. Foreign Key Relationships: All properly defined with CASCADE options for data integrity
3. Enum Constraints: Used for role, status, and payment_method to ensure data consistency
4. Check Constraints: Implemented for business logic validation
5. Indexes: Comprehensive indexing strategy for optimal query performance
6. Unique Constraints: Prevent duplicate bookings and reviews where appropriate
7. Triggers: Optional enhancements for automated timestamp updates and booking validation

Performance Considerations:
- Primary keys are indexed by default
- Foreign key columns are explicitly indexed
- Composite indexes created for frequent query patterns
- Date range queries optimized with appropriate indexes
- Search functionality supported with text field indexes

Security Features:
- Email format validation
- Phone number format validation
- Password stored as hash (application responsibility)
- Proper constraint validation at database level
*/
