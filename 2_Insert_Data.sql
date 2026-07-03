-- ==========================================
-- Hotel Management System
-- Insert Sample Data
-- Author: NW NEXUS
-- ==========================================

USE Hotel_System;

-- ==========================================
-- Insert Customers
-- ==========================================

INSERT INTO Customers (FullName, Phone, Email, NationalID)
VALUES
('Nada Zahran','01012345678','nada@gmail.com','30101012345678'),
('Ahmed Ali','01123456789','ahmed@gmail.com','30202098765432'),
('Sara Mohamed','01234567890','sara@gmail.com','30303012345678'),
('Omar Hassan','01512345678','omar@gmail.com','30404012345678'),
('Mona Adel','01098765432','mona@gmail.com','30505012345678'),
('Youssef Mahmoud','01187654321','youssef@gmail.com','30606012345678'),
('Laila Ahmed','01211223344','laila@gmail.com','30707012345678'),
('Karim Samy','01599887766','karim@gmail.com','30808012345678'),
('Mariam Ali','01044556677','mariam@gmail.com','30909012345678'),
('Hassan Mostafa','01155667788','hassan@gmail.com','31010012345678');

-- ==========================================
-- Insert Rooms
-- ==========================================

INSERT INTO Rooms (RoomNumber, Type, Price, FloorNumber, Status)
VALUES
(101,'Single',500,1,'Available'),
(102,'Single',500,1,'Occupied'),
(103,'Double',800,1,'Available'),
(104,'Double',800,1,'Maintenance'),
(201,'Suite',1500,2,'Occupied'),
(202,'Suite',1500,2,'Available'),
(203,'Single',500,2,'Available'),
(204,'Double',800,2,'Occupied'),
(301,'Suite',1800,3,'Available'),
(302,'Single',600,3,'Available');

-- ==========================================
-- Insert Bookings
-- ==========================================

INSERT INTO Bookings
(CustomerID, RoomID, CheckIn, CheckOut, NumberOfGuests, BookingStatus)
VALUES
(1,2,'2026-07-01','2026-07-05',1,'Checked In'),
(2,5,'2026-07-02','2026-07-06',2,'Confirmed'),
(3,4,'2026-07-04','2026-07-07',2,'Cancelled'),
(4,8,'2026-07-05','2026-07-08',3,'Checked In'),
(5,3,'2026-07-07','2026-07-10',2,'Confirmed'),
(6,1,'2026-07-10','2026-07-12',1,'Checked Out'),
(7,9,'2026-07-11','2026-07-15',4,'Confirmed'),
(8,6,'2026-07-12','2026-07-16',2,'Checked In');
