-- ========================================
-- ALX Airbnb Database Sample Data
-- Task 4: Database Seeding with Realistic Data
-- ========================================

-- Disable foreign key checks temporarily for easier insertion
SET FOREIGN_KEY_CHECKS = 0;

-- ========================================
-- 1. SAMPLE USER DATA
-- ========================================

INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
-- Hosts
('550e8400-e29b-41d4-a716-446655440001', 'Sarah', 'Johnson', 'sarah.johnson@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0101', 'host', '2023-01-15 08:30:00'),
('550e8400-e29b-41d4-a716-446655440002', 'Michael', 'Chen', 'michael.chen@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0102', 'host', '2023-02-20 14:15:00'),
('550e8400-e29b-41d4-a716-446655440003', 'Emma', 'Rodriguez', 'emma.rodriguez@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0103', 'host', '2023-03-10 09:45:00'),
('550e8400-e29b-41d4-a716-446655440004', 'David', 'Thompson', 'david.thompson@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0104', 'host', '2023-04-05 16:20:00'),
('550e8400-e29b-41d4-a716-446655440005', 'Lisa', 'Anderson', 'lisa.anderson@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0105', 'host', '2023-05-12 11:30:00'),

-- Guests
('550e8400-e29b-41d4-a716-446655440011', 'John', 'Smith', 'john.smith@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0111', 'guest', '2023-06-01 10:00:00'),
('550e8400-e29b-41d4-a716-446655440012', 'Alice', 'Brown', 'alice.brown@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0112', 'guest', '2023-06-15 13:25:00'),
('550e8400-e29b-41d4-a716-446655440013', 'Robert', 'Wilson', 'robert.wilson@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'guest', '2023-07-20 15:40:00'),
('550e8400-e29b-41d4-a716-446655440014', 'Jennifer', 'Davis', 'jennifer.davis@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0114', 'guest', '2023-08-08 09:15:00'),
('550e8400-e29b-41d4-a716-446655440015', 'Mark', 'Garcia', 'mark.garcia@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0115', 'guest', '2023-09-03 12:50:00'),
('550e8400-e29b-41d4-a716-446655440016', 'Amanda', 'Miller', 'amanda.miller@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0116', 'guest', '2023-10-10 14:30:00'),
('550e8400-e29b-41d4-a716-446655440017', 'James', 'Martinez', 'james.martinez@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'guest', '2023-11-18 16:45:00'),

-- Admin
('550e8400-e29b-41d4-a716-446655440021', 'Admin', 'User', 'admin@airbnb.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '+1-555-0121', 'admin', '2023-01-01 00:00:00');

-- ========================================
-- 2. SAMPLE PROPERTY DATA
-- ========================================

INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
-- Sarah Johnson's Properties
('650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 'Cozy Downtown Loft', 'Beautiful loft apartment in the heart of downtown with modern amenities, exposed brick walls, and stunning city views. Perfect for business travelers and couples seeking a urban getaway.', 'New York, NY, USA', 150.00, '2023-01-20 10:00:00', '2023-01-20 10:00:00'),
('650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Sunny Studio Apartment', 'Bright and airy studio apartment with large windows, fully equipped kitchen, and comfortable workspace. Located in a quiet neighborhood with easy access to public transportation.', 'Brooklyn, NY, USA', 85.00, '2023-02-10 14:30:00', '2023-03-15 09:20:00'),

-- Michael Chen's Properties  
('650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440002', 'Beachfront Villa Paradise', 'Luxurious 4-bedroom villa directly on the beach with private pool, outdoor dining area, and breathtaking ocean views. Includes full kitchen, entertainment system, and beach equipment.', 'Malibu, CA, USA', 450.00, '2023-02-25 11:15:00', '2023-04-10 16:45:00'),
('650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', 'Modern Mountain Cabin', 'Contemporary 3-bedroom cabin nestled in the mountains with panoramic views, hot tub, fireplace, and hiking trails nearby. Perfect for family retreats and nature lovers.', 'Aspen, CO, USA', 280.00, '2023-03-18 08:45:00', '2023-03-18 08:45:00'),

-- Emma Rodriguez's Properties
('650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440003', 'Historic Brownstone Suite', 'Elegant 2-bedroom suite in a beautifully restored 19th-century brownstone. Features original hardwood floors, vintage furnishings, and modern conveniences in a historic setting.', 'Boston, MA, USA', 200.00, '2023-03-25 13:20:00', '2023-05-20 11:30:00'),
('650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440003', 'Garden View Cottage', 'Charming 1-bedroom cottage surrounded by beautiful gardens. Quiet retreat with outdoor patio, barbecue area, and walking distance to local cafes and shops.', 'Portland, OR, USA', 120.00, '2023-04-12 15:50:00', '2023-04-12 15:50:00'),

-- David Thompson's Properties
('650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440004', 'Luxury Penthouse Suite', 'Spectacular penthouse with 360-degree city views, gourmet kitchen, marble bathrooms, and rooftop terrace. Premium location with concierge services and valet parking.', 'Chicago, IL, USA', 380.00, '2023-04-15 09:10:00', '2023-06-22 14:15:00'),

-- Lisa Anderson's Properties
('650e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440005', 'Lakefront Retreat', 'Peaceful 2-bedroom lakefront property with private dock, kayaks, fishing equipment, and stunning sunset views. Ideal for romantic getaways and family vacations.', 'Lake Tahoe, CA, USA', 220.00, '2023-05-20 12:35:00', '2023-07-08 10:25:00'),
('650e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440005', 'Urban Artist Loft', 'Creative space in the arts district with high ceilings, natural light, and eclectic decor. Features workspace area, gallery wall, and walking distance to museums and galleries.', 'Austin, TX, USA', 95.00, '2023-06-08 16:40:00', '2023-06-08 16:40:00');

-- ========================================
-- 3. SAMPLE BOOKING DATA
-- ========================================

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
-- Confirmed Bookings (Past and Current)
('750e8400-e29b-41d4-a716-446655440001', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440011', '2024-01-15', '2024-01-20', 750.00, 'confirmed', '2024-01-10 14:20:00'),
('750e8400-e29b-41d4-a716-446655440002', '650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440012', '2024-02-10', '2024-02-17', 3150.00, 'confirmed', '2024-02-05 09:15:00'),
('750e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440013', '2024-03-22', '2024-03-25', 600.00, 'confirmed', '2024-03-18 11:30:00'),
('750e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440014', '2024-04-05', '2024-04-08', 1140.00, 'confirmed', '2024-04-01 13:45:00'),
('750e8400-e29b-41d4-a716-446655440005', '650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440015', '2024-05-12', '2024-05-19', 595.00, 'confirmed', '2024-05-08 16:20:00'),
('750e8400-e29b-41d4-a716-446655440006', '650e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440016', '2024-06-20', '2024-06-27', 1540.00, 'confirmed', '2024-06-15 10:35:00'),

-- Future Bookings (Confirmed)
('750e8400-e29b-41d4-a716-446655440007', '650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440017', '2025-07-15', '2025-07-22', 1960.00, 'confirmed', '2025-06-20 12:40:00'),
('750e8400-e29b-41d4-a716-446655440008', '650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440011', '2025-08-10', '2025-08-15', 600.00, 'confirmed', '2025-06-25 15:25:00'),
('750e8400-e29b-41d4-a716-446655440009', '650e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440012', '2025-09-05', '2025-09-12', 665.00, 'confirmed', '2025-06-28 09:10:00'),

-- Pending Bookings
('750e8400-e29b-41d4-a716-446655440010', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440013', '2025-08-20', '2025-08-25', 750.00, 'pending', '2025-06-28 14:15:00'),
('750e8400-e29b-41d4-a716-446655440011', '650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440014', '2025-10-12', '2025-10-19', 3150.00, 'pending', '2025-06-28 16:30:00'),

-- Canceled Bookings
('750e8400-e29b-41d4-a716-446655440012', '650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440015', '2024-03-15', '2024-03-18', 1140.00, 'canceled', '2024-03-10 11:20:00'),
('750e8400-e29b-41d4-a716-446655440013', '650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440016', '2024-07-04', '2024-07-11', 1400.00, 'canceled', '2024-06-30 13:50:00');

-- ========================================
-- 4. SAMPLE PAYMENT DATA
-- ========================================

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
-- Payments for confirmed bookings
('850e8400-e29b-41d4-a716-446655440001', '750e8400-e29b-41d4-a716-446655440001', 750.00, '2024-01-10 14:25:00', 'credit_card'),
('850e8400-e29b-41d4-a716-446655440002', '750e8400-e29b-41d4-a716-446655440002', 3150.00, '2024-02-05 09:20:00', 'stripe'),
('850e8400-e29b-41d4-a716-446655440003', '750e8400-e29b-41d4-a716-446655440003', 600.00, '2024-03-18 11:35:00', 'paypal'),
('850e8400-e29b-41d4-a716-446655440004', '750e8400-e29b-41d4-a716-446655440004', 1140.00, '2024-04-01 13:50:00', 'credit_card'),
('850e8400-e29b-41d4-a716-446655440005', '750e8400-e29b-41d4-a716-446655440005', 595.00, '2024-05-08 16:25:00', 'stripe'),
('850e8400-e29b-41d4-a716-446655440006', '750e8400-e29b-41d4-a716-446655440006', 1540.00, '2024-06-15 10:40:00', 'credit_card'),
('850e8400-e29b-41d4-a716-446655440007', '750e8400-e29b-41d4-a716-446655440007', 1960.00, '2025-06-20 12:45:00', 'paypal'),
('850e8400-e29b-41d4-a716-446655440008', '750e8400-e29b-41d4-a716-446655440008', 600.00, '2025-06-25 15:30:00', 'stripe'),
('850e8400-e29b-41d4-a716-446655440009', '750e8400-e29b-41d4-a716-446655440009', 665.00, '2025-06-28 09:15:00', 'credit_card');

-- ========================================
-- 5. SAMPLE REVIEW DATA
-- ========================================

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
-- Reviews for completed stays
('950e8400-e29b-41d4-a716-446655440001', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440011', 5, 'Absolutely amazing stay! The loft was exactly as described with stunning city views. Sarah was an excellent host, very responsive and helpful. The location was perfect for exploring downtown. Would definitely book again!', '2024-01-22 10:30:00'),

('950e8400-e29b-41d4-a716-446655440002', '650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440012', 5, 'This beachfront villa exceeded all expectations! Waking up to ocean views every morning was magical. The private pool and beach access made it perfect for our family vacation. Michael provided excellent recommendations for local restaurants. Highly recommended!', '2024-02-19 14:15:00'),

('950e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440013', 4, 'Beautiful historic brownstone with so much character. The vintage furnishings and original hardwood floors created a unique atmosphere. Location was great for walking to attractions. Only minor issue was the shower pressure, but overall a wonderful stay.', '2024-03-27 16:45:00'),

('950e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440014', 5, 'Luxury at its finest! The penthouse suite was spectacular with incredible city views from every room. The rooftop terrace was perfect for evening cocktails. David was professional and accommodating. Worth every penny for a special occasion.', '2024-04-10 11:20:00'),

('950e8400-e29b-41d4-a716-446655440005', '650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440015', 4, 'Great value for a week-long stay in Brooklyn. The studio was clean, well-equipped, and in a safe neighborhood. Easy subway access to Manhattan. Sarah provided clear instructions and was available when needed. Would recommend for budget-conscious travelers.', '2024-05-21 09:40:00'),

('950e8400-e29b-41d4-a716-446655440006', '650e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440016', 5, 'Perfect lakefront getaway! The sunset views were breathtaking, and we loved having kayaks included. The property was immaculate and well-stocked with everything we needed. Lisa was a wonderful host with great local recommendations. Already planning our return trip!', '2024-06-29 13:25:00'),

-- Additional reviews from different users
('950e8400-e29b-41d4-a716-446655440007', '650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440012', 4, 'Loved the downtown location and modern amenities. The exposed brick walls and high ceilings created a great atmosphere. Perfect for our business trip with excellent WiFi and workspace. Would stay here again for work travel.', '2024-03-10 15:30:00'),

('950e8400-e29b-41d4-a716-446655440008', '650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440017', 5, 'Charming cottage with beautiful gardens! Emma was incredibly welcoming and the outdoor patio was perfect for morning coffee. Great location within walking distance of local shops and cafes. Highly recommend for a peaceful retreat.', '2024-05-15 12:10:00'),

('950e8400-e29b-41d4-a716-446655440009', '650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440013', 5, 'Mountain cabin was absolutely perfect! The views were stunning and the hot tub was amazing after hiking. Michael provided excellent trail maps and local recommendations. The cabin had everything we needed for a comfortable family retreat.', '2024-04-20 17:55:00'),

('950e8400-e29b-41d4-a716-446655440010', '650e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440014', 3, 'Interesting artist loft in the arts district. Good location for exploring galleries and museums. The space was creative and unique, though could use some updates to the furniture. Lisa was responsive and helpful with recommendations.', '2024-06-05 14:40:00');

-- ========================================
-- 6. SAMPLE MESSAGE DATA
-- ========================================

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
-- Pre-booking inquiries
('a50e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440001', 'Hi Sarah! I\'m interested in booking your downtown loft for January 15-20. Is it available? Also, is parking included?', '2024-01-08 10:15:00'),
('a50e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440011', 'Hi John! Yes, the loft is available for those dates. Parking is not included, but there\'s a public garage two blocks away. I can send you the details. Would you like me to hold the dates for you?', '2024-01-08 11:30:00'),
('a50e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440001', 'That would be great! Please hold the dates. I\'ll book today. Also, what\'s the check-in process?', '2024-01-08 12:45:00'),

-- Booking confirmations and instructions
('a50e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440011', 'Perfect! I see your booking is confirmed. Check-in is after 3 PM. I\'ll send you the door code and WiFi password closer to your arrival date. Looking forward to hosting you!', '2024-01-10 15:00:00'),

-- Guest questions during stay
('a50e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440002', 'Hi Michael! We\'re having an amazing time at the villa. Quick question - do you have any beach umbrellas we could use?', '2024-02-12 14:20:00'),
('a50e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440012', 'So glad you\'re enjoying it! Yes, there are beach umbrellas in the garage storage room, right side. There\'s also a cooler and beach chairs if you need them. Have a great day!', '2024-02-12 14:45:00'),

-- Post-stay follow-ups
('a50e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440011', 'Hi John! Hope you had a wonderful stay at the loft. If you have a moment, I\'d really appreciate a review. Thanks again for being such a great guest!', '2024-01-21 09:00:00'),
('a50e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440001', 'Thanks Sarah! We had an incredible time. The loft was perfect and you were an amazing host. I\'ll definitely leave a 5-star review and would love to book again in the future!', '2024-01-21 11:30:00'),

-- New inquiry conversations
('a50e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440013', '550e8400-e29b-41d4-a716-446655440003', 'Hello Emma! Your brownstone suite looks beautiful. I\'m planning a romantic weekend getaway for March 22-25. Is it available and pet-friendly?', '2024-03-15 16:20:00'),
('a50e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440013', 'Hi Robert! Thank you for your interest. The suite is available for those dates and yes, we are pet-friendly with a small additional fee. The historic neighborhood is perfect for romantic walks. Would you like to proceed with booking?', '2024-03-15 17:45:00'),

-- Booking issue resolution
('a50e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440015', '550e8400-e29b-41d4-a716-446655440004', 'Hi David, I need to cancel my Chicago penthouse booking for March 15-18 due to a family emergency. I understand there may be a cancellation fee. Please let me know the process.', '2024-03-12 13:20:00'),
('a50e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440015', 'Hi Mark, I\'m sorry to hear about your family emergency. Don\'t worry about the cancellation fee - I\'ll process a full refund given the circumstances. I hope everything works out okay with your family.', '2024-03-12 14:10:00'),

-- Host-to-host communication
('a50e8400-e29b-41d4-a716-446655440013', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Hey Sarah! I saw your loft got great reviews. Do you have any tips for new hosts? I just listed my mountain cabin and want to make sure I provide the best experience.', '2024-04-01 10:30:00'),
('a50e8400-e29b-41d4-a716-446655440014', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', 'Hi Michael! Congrats on your new listing! Key tips: detailed descriptions, quick responses to messages, provide local recommendations, and always have backup supplies. Your mountain cabin sounds amazing - I\'d love to stay there sometime!', '2024-04-01 12:15:00'),

-- Recent conversations
('a50e8400-e29b-41d4-a716-446655440015', '550e8400-e29b-41d4-a716-446655440017', '550e8400-e29b-41d4-a716-446655440002', 'Hi Michael! I\'m excited about our upcoming booking at your mountain cabin in July. Can you recommend any specific hiking trails for intermediate hikers?', '2025-06-25 09:30:00'),
('a50e8400-e29b-41d4-a716-446655440016', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440017', 'Hi James! Great to hear from you. For intermediate hiking, I highly recommend the Pine Ridge Trail (3 miles) and Aspen Grove Loop (5 miles). Both offer stunning views and are well-marked. I\'ll send you a detailed trail map before your arrival!', '2025-06-25 11:45:00');

-- ========================================
-- VERIFICATION QUERIES
-- ========================================

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- ========================================
-- DATA SUMMARY AND VERIFICATION QUERIES
-- ========================================

-- Query to verify data insertion
SELECT 'USER DATA SUMMARY' as summary_type;
SELECT 
    role,
    COUNT(*) as user_count,
    MIN(created_at) as earliest_registration,
    MAX(created_at) as latest_registration
FROM User 
GROUP BY role;

SELECT 'PROPERTY DATA SUMMARY' as summary_type;
SELECT 
    u.first_name,
    u.last_name,
    COUNT(p.property_id) as properties_owned,
    AVG(p.pricepernight) as avg_price_per_night,
    MIN(p.pricepernight) as min_price,
    MAX(p.pricepernight) as max_price
FROM User u
JOIN Property p ON u.user_id = p.host_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY properties_owned DESC;

SELECT 'BOOKING DATA SUMMARY' as summary_type;
SELECT 
    status,
    COUNT(*) as booking_count,
    SUM(total_price) as total_revenue,
    AVG(total_price) as avg_booking_value,
    AVG(DATEDIFF(end_date, start_date)) as avg_stay_duration
FROM Booking 
GROUP BY status;

SELECT 'PAYMENT DATA SUMMARY' as summary_type;
SELECT 
    payment_method,
    COUNT(*) as payment_count,
    SUM(amount) as total_amount,
    AVG(amount) as avg_payment_amount
FROM Payment 
GROUP BY payment_method
ORDER BY total_amount DESC;

SELECT 'REVIEW DATA SUMMARY' as summary_type;
SELECT 
    rating,
    COUNT(*) as review_count,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Review)), 2) as percentage
FROM Review 
GROUP BY rating
ORDER BY rating DESC;

SELECT 'TOP RATED PROPERTIES' as summary_type;
SELECT 
    p.name,
    u.first_name as host_name,
    u.last_name as host_surname,
    p.location,
    COUNT(r.review_id) as review_count,
    AVG(r.rating) as avg_rating,
    p.pricepernight
FROM Property p
JOIN User u ON p.host_id = u.user_id
LEFT JOIN Review r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name, u.first_name, u.last_name, p.location, p.pricepernight
HAVING review_count > 0
ORDER BY avg_rating DESC, review_count DESC;

SELECT 'BOOKING TRENDS BY MONTH' as summary_type;
SELECT 
    DATE_FORMAT(created_at, '%Y-%m') as booking_month,
    COUNT(*) as bookings_made,
    SUM(total_price) as monthly_revenue,
    AVG(total_price) as avg_booking_value
FROM Booking 
WHERE status = 'confirmed'
GROUP BY DATE_FORMAT(created_at, '%Y-%m')
ORDER BY booking_month;

SELECT 'HOST PERFORMANCE SUMMARY' as summary_type;
SELECT 
    u.first_name,
    u.last_name,
    u.email,
    COUNT(DISTINCT p.property_id) as properties_listed,
    COUNT(DISTINCT b.booking_id) as total_bookings,
    COALESCE(SUM(b.total_price), 0) as total_earnings,
    COALESCE(AVG(r.rating), 0) as avg_property_rating,
    COUNT(DISTINCT r.review_id) as total_reviews
FROM User u
LEFT JOIN Property p ON u.user_id = p.host_id
LEFT JOIN Booking b ON p.property_id = b.property_id AND b.status = 'confirmed'
LEFT JOIN Review r ON p.property_id = r.property_id
WHERE u.role = 'host'
GROUP BY u.user_id, u.first_name, u.last_name, u.email
ORDER BY total_earnings DESC;

SELECT 'GUEST ACTIVITY SUMMARY' as summary_type;
SELECT 
    u.first_name,
    u.last_name,
    COUNT(DISTINCT b.booking_id) as total_bookings,
    SUM(CASE WHEN b.status = 'confirmed' THEN b.total_price ELSE 0 END) as total_spent,
    COUNT(DISTINCT r.review_id) as reviews_written,
    AVG(r.rating) as avg_rating_given
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id
LEFT JOIN Review r ON u.user_id = r.user_id
WHERE u.role = 'guest'
GROUP BY u.user_id, u.first_name, u.last_name
HAVING total_bookings > 0
ORDER BY total_spent DESC;

-- ========================================
-- SAMPLE COMPLEX QUERIES FOR TESTING
-- ========================================

SELECT 'AVAILABLE PROPERTIES FOR SPECIFIC DATES' as query_type;
-- Find properties available for July 2025
SELECT DISTINCT
    p.property_id,
    p.name,
    p.location,
    p.pricepernight,
    u.first_name as host_name
FROM Property p
JOIN User u ON p.host_id = u.user_id
WHERE p.property_id NOT IN (
    SELECT b.property_id 
    FROM Booking b 
    WHERE b.status IN ('confirmed', 'pending')
    AND (
        ('2025-07-01' BETWEEN b.start_date AND b.end_date) OR
        ('2025-07-07' BETWEEN b.start_date AND b.end_date) OR
        (b.start_date BETWEEN '2025-07-01' AND '2025-07-07')
    )
)
ORDER BY p.pricepernight;

SELECT 'PROPERTIES WITH HIGHEST REVENUE' as query_type;
-- Properties generating the most revenue
SELECT 
    p.name,
    p.location,
    u.first_name as host_name,
    COUNT(b.booking_id) as total_bookings,
    SUM(b.total_price) as total_revenue,
    AVG(r.rating) as avg_rating
FROM Property p
JOIN User u ON p.host_id = u.user_id
LEFT JOIN Booking b ON p.property_id = b.property_id AND b.status = 'confirmed'
LEFT JOIN Review r ON p.property_id = r.property_id
GROUP BY p.property_id, p.name, p.location, u.first_name
HAVING total_bookings > 0
ORDER BY total_revenue DESC
LIMIT 5;

-- ========================================
-- NOTES AND DOCUMENTATION
-- ========================================

/*
SAMPLE DATA CHARACTERISTICS:

1. USERS (13 total):
   - 5 Hosts with multiple properties
   - 7 Guests with varying booking patterns  
   - 1 Admin user

2. PROPERTIES (9 total):
   - Diverse property types: lofts, villas, cabins, cottages, penthouses
   - Price range: $85 - $450 per night
   - Multiple locations across US cities
   - Realistic descriptions and amenities

3. BOOKINGS (13 total):
   - Mix of confirmed (9), pending (2), and canceled (2) bookings
   - Past, current, and future reservations
   - Realistic date ranges and pricing
   - Demonstrates booking conflicts prevention

4. PAYMENTS (9 total):
   - All payment methods represented (credit_card, paypal, stripe)
   - Amounts match confirmed booking totals
   - Realistic payment timing

5. REVIEWS (10 total):
   - Ratings from 3-5 stars (realistic distribution)
   - Detailed, authentic-sounding comments
   - Mix of positive feedback and constructive criticism
   - Demonstrates guest-property relationships

6. MESSAGES (16 total):
   - Pre-booking inquiries and responses
   - Booking confirmations and instructions
   - During-stay support and questions
   - Post-stay follow-ups and reviews
   - Host-to-host communication
   - Cancellation handling

BUSINESS SCENARIOS COVERED:
- Multi-property hosts
- Repeat customers
- Seasonal booking patterns
- Property performance metrics
- Guest satisfaction tracking
- Communication workflows
- Payment processing
- Cancellation management
- Review system functionality
- Host performance analysis

TESTING CAPABILITIES:
- Foreign key relationships
- Data integrity constraints
- Complex queries (availability, revenue, ratings)
- Date range conflicts
- User role management
- Payment tracking
- Communication threads
- Business intelligence reporting
*/
