-- ==========================================
-- Hotel Management System
-- SQL Queries & Reports
-- Author: NW NEXUS
-- ==========================================

USE Hotel_System;

-- ==========================================
-- Customer Reports
-- ==========================================

-- Show all customers
SELECT *
FROM Customers;

-- Show customer names and phone numbers
SELECT FullName, Phone
FROM Customers;

-- Search customer by ID
SELECT *
FROM Customers
WHERE CustomerID = 1;

-- Search customer by name
SELECT *
FROM Customers
WHERE FullName = 'Nada Zahran';

-- Customers whose names start with N
SELECT *
FROM Customers
WHERE FullName LIKE 'N%';

-- Customers ordered by name
SELECT *
FROM Customers
ORDER BY FullName;

-- ==========================================
-- Room Reports
-- ==========================================

-- Show all rooms
SELECT *
FROM Rooms;

-- Available rooms
SELECT *
FROM Rooms
WHERE Status = 'Available';

-- Occupied rooms
SELECT *
FROM Rooms
WHERE Status = 'Occupied';

-- Rooms under maintenance
SELECT *
FROM Rooms
WHERE Status = 'Maintenance';

-- Rooms with price greater than 700
SELECT *
FROM Rooms
WHERE Price > 700;

-- Suite rooms
SELECT *
FROM Rooms
WHERE Type = 'Suite';

-- ==========================================
-- Booking Reports
-- ==========================================

-- Current Guests
SELECT
    C.FullName,
    R.RoomNumber,
    B.CheckIn,
    B.CheckOut
FROM Bookings B
JOIN Customers C
ON B.CustomerID = C.CustomerID
JOIN Rooms R
ON B.RoomID = R.RoomID
WHERE B.BookingStatus = 'Checked In';

-- Confirmed Bookings
SELECT
    C.FullName,
    R.RoomNumber,
    R.Price,
    B.CheckIn,
    B.CheckOut
FROM Bookings B
JOIN Customers C
ON B.CustomerID = C.CustomerID
JOIN Rooms R
ON B.RoomID = R.RoomID
WHERE B.BookingStatus = 'Confirmed';

-- Cancelled Bookings
SELECT
    C.FullName,
    R.RoomNumber,
    B.CheckIn,
    B.CheckOut
FROM Bookings B
JOIN Customers C
ON B.CustomerID = C.CustomerID
JOIN Rooms R
ON B.RoomID = R.RoomID
WHERE B.BookingStatus = 'Cancelled';

-- ==========================================
-- Revenue Reports
-- ==========================================

-- Stay duration and total cost
SELECT
    C.FullName,
    R.RoomNumber,
    R.Price,
    DATEDIFF(B.CheckOut,B.CheckIn) AS StayDays,
    R.Price * DATEDIFF(B.CheckOut,B.CheckIn) AS TotalCost
FROM Bookings B
JOIN Customers C
ON B.CustomerID=C.CustomerID
JOIN Rooms R
ON B.RoomID=R.RoomID;

-- ==========================================
-- Statistical Reports
-- ==========================================

-- Number of customers
SELECT COUNT(*) AS TotalCustomers
FROM Customers;

-- Average room price
SELECT AVG(Price) AS AveragePrice
FROM Rooms;

-- Highest room price
SELECT MAX(Price) AS HighestPrice
FROM Rooms;

-- Lowest room price
SELECT MIN(Price) AS LowestPrice
FROM Rooms;

-- Total room prices
SELECT SUM(Price) AS TotalPrices
FROM Rooms;

-- Number of bookings for each customer
SELECT
    C.FullName,
    COUNT(B.BookingID) AS NumberOfBookings
FROM Bookings B
JOIN Customers C
ON B.CustomerID = C.CustomerID
GROUP BY C.FullName;

-- Average price by room type
SELECT
    Type,
    AVG(Price) AS AveragePrice
FROM Rooms
GROUP BY Type;
