To normalize the database design to 3NF, let's review each entity and its attributes for potential redundancies or violations.

Understanding 3NF
A relation is in 3NF if it is in 2NF and there are no transitive dependencies. A transitive dependency occurs when a non-key attribute is dependent on another non-key attribute.

Current Schema Review and Normalization Steps
Let's examine each entity:

1. User Table
User
user_id: Primary Key, UUID, Indexed
first_name: VARCHAR, NOT NULL
last_name: VARCHAR, NOT NULL
email: VARCHAR, UNIQUE, NOT NULL
password_hash: VARCHAR, NOT NULL
phone_number: VARCHAR, NULL
role: ENUM (guest, host, admin), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Analysis: This table appears to be in 3NF. All attributes are directly dependent on the user_id primary key. There are no repeating groups, and no non-key attributes are dependent on other non-key attributes.

Action: No changes needed.

2. Property Table
Property
property_id: Primary Key, UUID, Indexed
host_id: Foreign Key, references User(user_id)
name: VARCHAR, NOT NULL
description: TEXT, NOT NULL
location: VARCHAR, NOT NULL
pricepernight: DECIMAL, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP
Analysis: This table seems to be in 3NF. All attributes are directly dependent on the property_id. host_id is a foreign key, correctly referencing the User table.

Action: No changes needed.

3. Booking Table
Booking
booking_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
start_date: DATE, NOT NULL
end_date: DATE, NOT NULL
total_price: DECIMAL, NOT NULL
status: ENUM (pending, confirmed, canceled), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Analysis: This table is in 3NF. All attributes are directly dependent on booking_id. property_id and user_id are foreign keys and do not introduce transitive dependencies.

Action: No changes needed.

4. Payment Table
Payment
payment_id: Primary Key, UUID, Indexed
booking_id: Foreign Key, references Booking(booking_id)
amount: DECIMAL, NOT NULL
payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
payment_method: ENUM (credit_card, paypal, stripe), NOT NULL
Analysis: This table is in 3NF. All attributes are directly dependent on payment_id. booking_id is a foreign key.

Action: No changes needed.

5. Review Table
Review
review_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
comment: TEXT, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Analysis: This table is in 3NF. All attributes are directly dependent on review_id. property_id and user_id are foreign keys.

Action: No changes needed.

6. Message Table
Message
message_id: Primary Key, UUID, Indexed
sender_id: Foreign Key, references User(user_id)
recipient_id: Foreign Key, references User(user_id)
message_body: TEXT, NOT NULL
sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Analysis: This table is in 3NF. All attributes are directly dependent on message_id. sender_id and recipient_id are foreign keys.

Action: No changes needed.

Explanation of Normalization Steps
The provided database schema is already well-designed and appears to be in the Third Normal Form (3NF). Here's a breakdown of why, and the steps taken (or not needed) to ensure 3NF compliance:

First Normal Form (1NF) Compliance:

No Repeating Groups: Each table has a unique primary key, and there are no repeating groups of columns. For example, a user doesn't have phone_number1, phone_number2. Instead, phone_number is a single attribute.

Atomic Values: All attributes hold atomic (indivisible) values. For instance, first_name and last_name are separate, and location is a single string (assuming it represents a specific address or city and not a composite of street, city, zip).

Second Normal Form (2NF) Compliance:

A table is in 2NF if it is in 1NF and all non-key attributes are fully functionally dependent on the primary key. This means no non-key attribute is dependent on only a part of a composite primary key.

In this schema, all primary keys are single-attribute (user_id, property_id, booking_id, payment_id, review_id, message_id). Therefore, by definition, there cannot be partial dependencies, and all tables are automatically in 2NF if they are in 1NF.

Third Normal Form (3NF) Compliance:

A table is in 3NF if it is in 2NF and there are no transitive dependencies. A transitive dependency exists when a non-key attribute is dependent on another non-key attribute.

User Table: first_name, last_name, email, password_hash, phone_number, role, created_at are all directly dependent on user_id. No non-key attribute is dependent on another non-key attribute.

Property Table: host_id, name, description, location, pricepernight, created_at, updated_at are all directly dependent on property_id. host_id is a foreign key, properly linking to the User table, and does not represent a transitive dependency within the Property table itself.

Booking Table: property_id, user_id, start_date, end_date, total_price, status, created_at are all directly dependent on booking_id. property_id and user_id are foreign keys.

Payment Table: booking_id, amount, payment_date, payment_method are all directly dependent on payment_id. booking_id is a foreign key.

Review Table: property_id, user_id, rating, comment, created_at are all directly dependent on review_id. property_id and user_id are foreign keys.

Message Table: sender_id, recipient_id, message_body, sent_at are all directly dependent on message_id. sender_id and recipient_id are foreign keys.

Conclusion:

The provided database schema already adheres to the principles of Third Normal Form (3NF). There were no identified redundancies or violations that required structural adjustments. The relationships between entities are established using foreign keys, which is the correct approach for maintaining data integrity and avoiding redundancy, rather than embedding dependent data directly within tables.
