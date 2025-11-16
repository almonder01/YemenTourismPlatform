-- Create a new database for the project
CREATE DATABASE IF NOT EXISTS yemen_tourism_db;
USE yemen_tourism_db;

-- Table for user accounts
-- The 'role' column will distinguish between regular users and administrators.
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL, -- Storing hashed passwords is a security best practice
    role ENUM('user', 'admin') NOT NULL DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for tourist destinations in Yemen
CREATE TABLE destinations (
    destination_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    is_featured BOOLEAN DEFAULT FALSE,
    image_url VARCHAR(255) -- URL to a representative image
);

-- Table for travel packages associated with a destination
CREATE TABLE packages (
    package_id INT AUTO_INCREMENT PRIMARY KEY,
    destination_id INT NOT NULL,
    name VARCHAR(100) NOT NULL, -- e.g., 'Gold', 'Silver', 'Adventure Trek'
    description TEXT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (destination_id) REFERENCES destinations(destination_id) ON DELETE CASCADE
);

-- Table for booking records
-- Connects a user to a specific package they have booked.
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    package_id INT NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (package_id) REFERENCES packages(package_id)
);
CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NULL, -- Can be NULL if submitted by a non-logged-in user
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

ALTER TABLE bookings
ADD COLUMN travel_date DATE NOT NULL AFTER package_id,
ADD COLUMN number_of_travelers INT NOT NULL DEFAULT 1 AFTER travel_date,
ADD COLUMN special_requests TEXT NULL AFTER number_of_travelers,
ADD COLUMN total_price DECIMAL(10, 2) NOT NULL AFTER special_requests;

ALTER TABLE destinations
ADD COLUMN summary TEXT NULL AFTER name;

ALTER TABLE destinations MODIFY COLUMN summary VARCHAR(255) NOT NULL;

ALTER TABLE destinations MODIFY COLUMN description TEXT NULL;