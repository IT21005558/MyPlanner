--DATABASE SCRIPT FOR MYPLANNER
CREATE DATABASE myplanner_db;
USE myplanner_db;

-- Create the clientdata table to store client information
CREATE TABLE clientdata (
    cid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    gender VARCHAR(10),
    dob VARCHAR(10),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255) NOT NULL,
    userType VARCHAR(10) DEFAULT 'user',
    CONSTRAINT chk_gender CHECK (gender IN ('Male', 'Female', 'Other', NULL)),
    CONSTRAINT chk_userType CHECK (userType IN ('user', 'admin'))
);

-- Insert sample client data
INSERT INTO clientdata (name, gender, dob, email, phone, address, username, password, userType) VALUES
    ('ranugi', 'Female', '2001-03-16', 'ranugirathnayaka2001@gmail.com', '+94740900542', 'Malabe, Colombo', 'ranu111', 'ranu@111', 'user'),
    ('Priya Sharma', 'Female', '1990-04-15', 'priya.sharma@email.com', '+94771234567', '123 Galle Road, Colombo', 'priyasharma', 'priyasharma@123', 'user'),
    ('Kamal Perera', 'Male', '1985-08-22', 'kamal.perera@email.com', '+94769876543', '456 Kandy Road, Kandy', 'kamalperera', 'kamalperera@4567', 'user'),
    ('Nisha Fernando', 'Female', '1995-12-10', 'nisha.fernando@email.com', '+94767778899', '789 Negombo Road, Negombo', 'nishafernando', 'nishafernando@99', 'user');

-- Create the vendordata table to store vendor information
CREATE TABLE vendordata (
    vid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    services VARCHAR(255) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Insert sample vendor data
INSERT INTO vendordata (name, email, phone, address, services, username, password) VALUES
    ('Sunset Caterers', 'contact@sunsetcaterers.com', '+94761112233', '101 Beach Road, Galle', 'Catering, Buffet Services', 'sunsetcaterers', 'sunsetcaterers@1'),
    ('Elegant Events', 'info@elegantevents.com', '+94764445566', '202 Lotus Road, Colombo', 'Event Planning, Decoration', 'elegantevents', 'elegantevents@34'),
    ('Melody Music', 'melodymusic@email.com', '+94768889900', '303 Hill Street, Nuwara Eliya', 'Live Music, DJ Services', 'melodymusic', 'melodymusic@2025');

-- Create the bookingdata table to store booking details
CREATE TABLE bookingdata (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    vendor_id INT,
    hotel VARCHAR(255),
    hall VARCHAR(255),
    edate DATE,
    etime TIME,
    FOREIGN KEY (client_id) REFERENCES clientdata(cid) ON DELETE CASCADE,
    FOREIGN KEY (vendor_id) REFERENCES vendordata(vid) ON DELETE SET NULL,
    CONSTRAINT chk_edate CHECK (edate >= CURDATE())
);

-- Insert sample booking data
INSERT INTO bookingdata (client_id, vendor_id, hotel, hall, edate, etime) VALUES
    (1, 1, 'Galle Face Hotel', 'Sapphire Ballroom', '2025-06-15', '18:00:00'),
    (2, 2, 'Cinnamon Grand', 'Oak Room', '2025-07-10', '19:30:00'), 
    (3, 3, 'Shangri-La Colombo', 'Crystal Hall', '2025-08-05', '17:00:00'), 
    (4, NULL, 'Jetwing Lighthouse', 'Grand Hall', '2025-09-01', '18:30:00'); 