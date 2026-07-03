-- ==========================================
-- Hotel Management System
-- Database Creation Script
-- Author: Nada Zahran
-- ==========================================

-- Create Database
DROP DATABASE IF EXISTS Hotel_System;

CREATE DATABASE Hotel_System;

USE Hotel_System;

-- ==========================================
-- Customers Table
-- ==========================================

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    NationalID VARCHAR(20) UNIQUE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- Rooms Table
-- ==========================================

CREATE TABLE Rooms (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomNumber INT UNIQUE,
    Type VARCHAR(30),
    Price DECIMAL(10,2),
    FloorNumber INT,
    Status ENUM('Available','Occupied','Maintenance')
    DEFAULT 'Available'
);

-- ==========================================
-- Bookings Table
-- ==========================================

CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    RoomID INT,
    CheckIn DATE,
    CheckOut DATE,
    NumberOfGuests INT,
    BookingStatus ENUM(
        'Confirmed',
        'Checked In',
        'Checked Out',
        'Cancelled'
    ) DEFAULT 'Confirmed',

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (RoomID)
        REFERENCES Rooms(RoomID)
);
