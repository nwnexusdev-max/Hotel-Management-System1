-- ==========================================
-- Hotel Management System
-- Views
-- Author : NW NEXUUS 
-- ==========================================

USE Hotel_System;
CREATE VIEW CurrentGuests AS
SELECT
    C.FullName,
    R.RoomNumber,
    R.Type,
    B.CheckIn,
    B.CheckOut
FROM Bookings B
JOIN Customers C
ON B.CustomerID = C.CustomerID
JOIN Rooms R
ON B.RoomID = R.RoomID
WHERE B.BookingStatus = 'Checked In';

CREATE VIEW AvailableRooms AS
SELECT
    RoomNumber,
    Type,
    Price,
    FloorNumber
FROM Rooms
WHERE Status = 'Available';

CREATE VIEW RevenueReport AS
SELECT
    C.FullName,
    R.RoomNumber,
    DATEDIFF(B.CheckOut,B.CheckIn) AS StayDays,
    R.Price,
    R.Price * DATEDIFF(B.CheckOut,B.CheckIn) AS TotalCost
FROM Bookings B
JOIN Customers C
ON B.CustomerID = C.CustomerID
JOIN Rooms R
ON B.RoomID = R.RoomID;


DELIMITER $$

CREATE PROCEDURE AddBooking(

    IN p_CustomerID INT,
    IN p_RoomID INT,
    IN p_CheckIn DATE,
    IN p_CheckOut DATE,
    IN p_NumberOfGuests INT

)

BEGIN

INSERT INTO Bookings
(
CustomerID,
RoomID,
CheckIn,
CheckOut,
NumberOfGuests
)

VALUES
(
p_CustomerID,
p_RoomID,
p_CheckIn,
p_CheckOut,
p_NumberOfGuests
);

END $$

DELIMITER ;
