CREATE DATABASE MontrealScenicTours
USE MontrealScenicTours

-- role for data reading
CREATE ROLE Customer_Service AUTHORIZATION db_datareader
-- role for data writing
CREATE ROLE Tour_Manager AUTHORIZATION db_datawriter
-- role for admin, it administrates the employers
CREATE ROLE Administrator AUTHORIZATION db_accessadmin
-- role for the backup people
CREATE ROLE Backup_Management AUTHORIZATION db_backupoperator
-- sys admin
CREATE ROLE System_Admin AUTHORIZATION db_owner

CREATE TABLE Place (
	Place_ID CHAR(6) CONSTRAINT Place_Place_ID_PK PRIMARY KEY (Place_ID),
	Place_Stno INT,
	Place_Stname VARCHAR(64),
	Place_City VARCHAR(64),
	Place_Postal CHAR(7) 
);

CREATE TABLE Venue (
	Ven_ID CHAR (6) CONSTRAINT Venue_Ven_ID_PK PRIMARY KEY (Ven_ID),
	Ven_Name VARCHAR(64) CONSTRAINT Venue_Ven_Name_UK NOT NULL,
	Ven_Type VARCHAR(32),
	Ven_Desc VARCHAR(64),
	Ven_Idx INT IDENTITY (100000, 1),
	Place_ID CHAR(6) CONSTRAINT Venue_Place_ID_FK FOREIGN KEY (Place_ID) REFERENCES Place(Place_ID)
);

CREATE TABLE Guide (
	Guide_ID CHAR(6) CONSTRAINT Guide_Guide_ID_PK PRIMARY KEY (Guide_ID),
	Guide_Name VARCHAR(32) NOT NULL,
	Guide_DOH DATE NOT NULL,
	Guide_PHONE VARCHAR(12) NOT NULL,
	Guide_EMAIL VARCHAR(50),
	Place_ID CHAR(6) CONSTRAINT Guide_Place_ID_FK FOREIGN KEY (Place_ID) REFERENCES Place(Place_ID)
);

CREATE TABLE Tourist(
	Tourist_ID CHAR(6) CONSTRAINT Tourist_Tourist_ID_PK PRIMARY KEY (Tourist_ID),
	Tourist_Name VARCHAR(32) NOT NULL,
	Tourist_Phone VARCHAR(12) NOT NULL,
	Tourist_Email VARCHAR(50),
	Ven_ID CHAR(6) CONSTRAINT Tourist_Ven_ID_FK FOREIGN KEY (Ven_ID) REFERENCES Venue(Ven_ID)
);

CREATE TABLE Tour (
	Tour_ID CHAR(6) CONSTRAINT Tour_Tour_ID_PK PRIMARY KEY (Tour_ID),
	Tour_Name VARCHAR(32) CONSTRAINT Tour_Tour_Name_NN NOT NULL,
	Tour_Dur INT,
	Tour_Fee MONEY,
	Tour_Order VARCHAR(64)
);

CREATE TABLE Qualification (
	Guide_ID CHAR(6) CONSTRAINT Qualification_Guide_ID_FK FOREIGN KEY (Guide_ID) REFERENCES Guide(Guide_ID) ON DELETE CASCADE,
	Tour_ID CHAR (6) CONSTRAINT Qualification_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID),
	Qual_Is_Rqd BIT CHECK (Qual_Is_Rqd = 0 OR Qual_Is_Rqd = 1),
	Qual_Date DATE NOT NULL,
	PRIMARY KEY (Guide_ID, Tour_ID)
);


CREATE TABLE TourVenue (
	Ven_ID CHAR (6) CONSTRAINT TourVenue_Ven_ID_FK FOREIGN KEY (Ven_ID) REFERENCES Venue(Ven_ID),
	Tour_ID CHAR(6) CONSTRAINT TourVenue_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID),
	PRIMARY KEY (Ven_ID, Tour_ID)
);

CREATE TABLE Trip (
	Trip_ID CHAR(6) CONSTRAINT Trip_Trip_ID_PK PRIMARY KEY (Trip_ID),
	Trip_Start TIME NOT NULL,
	Tour_ID CHAR(6) CONSTRAINT Trip_Tour_ID_FK FOREIGN KEY REFERENCES TOUR,
	Guide_ID CHAR(6) CONSTRAINT Trip_Guide_ID_FK FOREIGN KEY REFERENCES GUIDE
);

CREATE TABLE Visit (
	Trip_ID CHAR(6) CONSTRAINT Visit_Trip_ID_FK FOREIGN KEY (Trip_ID) REFERENCES Trip(Trip_ID),
	Tourist_ID CHAR(6) CONSTRAINT Visit_Tourist_ID_FK FOREIGN KEY (Tourist_ID) REFERENCES Tourist(Tourist_ID),
	PRIMARY KEY (Trip_ID, Tourist_ID)
);

CREATE INDEX idx_Tourist_Phone ON Tourist (Tourist_Phone);

CREATE INDEX idx_Guide_Phone ON Guide (Guide_Phone);


ALTER TABLE Tour
ADD CONSTRAINT Tour_name_UK UNIQUE (Tour_name);

ALTER TABLE Venue
ADD CONSTRAINT Ven_name_UK UNIQUE (Ven_name);

CREATE SEQUENCE placeID_next 
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NO CYCLE 
NO CACHE;


CREATE SEQUENCE guideID_next  
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NO CYCLE 
NO CACHE;


CREATE SEQUENCE touristID_next 
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NO CYCLE 
NO CACHE;

CREATE SEQUENCE tourID_next 
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NO CYCLE 
NO CACHE;

CREATE SEQUENCE tripID_next 
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NO CYCLE 
NO CACHE;

CREATE SEQUENCE venueID_next 
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NO CYCLE 
NO CACHE;

CREATE SEQUENCE tourVenueID_next 
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NO CYCLE 
NO CACHE;

CREATE SEQUENCE tripID_next 
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NO CYCLE 
NO CACHE;

CREATE SEQUENCE visitID_next 
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NO CYCLE 
NO CACHE;



/*Place*/
INSERT INTO Place (Place_ID, Place_Stno, Place_Stname, Place_City, Place_Postal) VALUES 
	(CONCAT('AD',NEXT VALUE FOR placeID_next),1234,'Lemieux Avenue', 'Montreal', 'H8N 2B6'),
	(CONCAT('AD',NEXT VALUE FOR placeID_next),5647,'Tardif Street', 'Montreal', 'H7L 3C9'),
	(CONCAT('AD',NEXT VALUE FOR placeID_next),9634,'Kennedy Street', 'Montreal', 'H8R 4R7'),
	(CONCAT('AD',NEXT VALUE FOR placeID_next),8820,'Maisonneuve Boulevard', 'Montreal', 'H2C 2V4'),
	(CONCAT('AD',NEXT VALUE FOR placeID_next),8133,'Original Street', 'Montreal', 'H9N 3B6');

/*Venue*/
INSERT INTO Venue (Ven_ID, Ven_Name, Ven_Type, Ven_Desc, Place_ID) VALUES
	(CONCAT('VN',NEXT VALUE FOR venueID_next),'La Roue de Mtl','Cultural','Montreal wheel is in old port','AD1005'), 
	(CONCAT('VN',NEXT VALUE FOR venueID_next),'McGill University','Historical','tour about the life of McGill & contribution to the university.','AD1004'), 
	(CONCAT('VN',NEXT VALUE FOR venueID_next),'Murals, and shops of Plateu,','Leisure','Murals in Plateu','AD1001'), 
	(CONCAT('VN',NEXT VALUE FOR venueID_next),'Montreal Fine Art Museum','Cultural','Montreal Museum of fine Art','AD1003'), 
	(CONCAT('VN',NEXT VALUE FOR venueID_next),'Mont Royal Park','Nature','Mont Royal park','AD1002');
	

/*Guides*/
INSERT INTO Guide (Guide_ID, Guide_Name, Guide_DOH, Guide_PHONE, Guide_EMAIL, Place_ID) VALUES
	(CONCAT('GD',NEXT VALUE FOR guideID_next),'John Smith', '2006-09-10', '514-567-8910', NULL, 'AD1002'), 
	(CONCAT('GD',NEXT VALUE FOR guideID_next),'Jane Austen', '2009-02-23', '514-527-8022', 'janeAusten@gmail.com', 'AD1005'), 
	(CONCAT('GD',NEXT VALUE FOR guideID_next),'Linda Nordstrom', '2014-04-21', '514-522-4858', 'nordstromLinda@gmail.com', 'AD1003'), 
	(CONCAT('GD',NEXT VALUE FOR guideID_next),'Kevin Hart', '2015-09-30', '514-986-3214', 'hartK@gmail.com', 'AD1001'), 
	(CONCAT('GD',NEXT VALUE FOR guideID_next),'Andrea Balazar', '2015-11-23', '514-963-4466', 'andreaB@gmail.com', 'AD1004'); 


/*Tourist*/
INSERT INTO Tourist (Tourist_ID, Tourist_Name, Tourist_Phone, Tourist_Email, Ven_ID) VALUES
	(CONCAT('TS',NEXT VALUE FOR touristID_next), 'Beyonce Carter', '514-123-5678', 'carterB@gmail.com', 'VN1003'),
	(CONCAT('TS',NEXT VALUE FOR touristID_next), 'Justin Power', '514-447-9664', 'PowerJ@gmail.com', 'VN1001'),
	(CONCAT('TS',NEXT VALUE FOR touristID_next), 'Penelope Garcia', '514-331-6998', 'PenelopeG@gmail.com', 'VN1004'),
	(CONCAT('TS',NEXT VALUE FOR touristID_next), 'Janine Teagues', '514-323-2323', NULL, 'VN1005'),
	(CONCAT('TS',NEXT VALUE FOR touristID_next), 'Minwan Kim', '514-119-8678', 'minwanKim@gmail.com', 'VN1002');

/*Tour*/
INSERT INTO Tour (Tour_ID, Tour_Name, Tour_Dur, Tour_Fee, Tour_Order) VALUES
	(CONCAT('TR',NEXT VALUE FOR tourID_next), 'Downtown Tour', 1, 25.00, 'VN1006 VN1004'),
	(CONCAT('TR',NEXT VALUE FOR tourID_next), 'Plateu Tour', 3, 50.00, 'VN1005'),
	(CONCAT('TR',NEXT VALUE FOR tourID_next), 'Mont Royal Tour', 2, 30.00, 'VN1007'),
	(CONCAT('TR',NEXT VALUE FOR tourID_next), 'Old Port Tour', 1, 50.00, 'VN1003 VN1003'),
	(CONCAT('TR',NEXT VALUE FOR tourID_next), 'WestMount Tour', 2, 10.00, 'VN1004');

/*Qualification*/
INSERT INTO Qualification (Guide_ID, Tour_ID, Qual_Is_Rqd, Qual_Date) VALUES
	('GD1001', 'TR1003', 1, '2015-01-01'),
	('GD1002', 'TR1005', 1, '2016-11-20'),
	('GD1003', 'TR1004', 1, '2014-09-13'),
	('GD1004', 'TR1001', 1, '2019-08-18'),
	('GD1005', 'TR1002', 1, '2012-03-26');

/*TourVenue*/

INSERT INTO TourVenue (Ven_ID, Tour_ID) VALUES
	('VN1001', 'TR1004'),
	('VN1002', 'TR1001'),
	('VN1003', 'TR1002'),
	('VN1004', 'TR1005'),
	('VN1005', 'TR1003');


/*Trip*/
INSERT INTO Trip (Trip_ID, Trip_Start, Tour_ID, Guide_ID) VALUES
	(CONCAT('TP',NEXT VALUE FOR tripID_next), '10:30:00', 'TR1003', 'GD1001'),
	(CONCAT('TP',NEXT VALUE FOR tripID_next), '08:45:00', 'TR1004', 'GD1004'),
	(CONCAT('TP',NEXT VALUE FOR tripID_next), '12:00:00', 'TR1002', 'GD1003'),
	(CONCAT('TP',NEXT VALUE FOR tripID_next), '10:00:00', 'TR1005', 'GD1002'),
	(CONCAT('TP',NEXT VALUE FOR tripID_next), '11:15:00', 'TR1001', 'GD1005');


/*Visit*/
INSERT INTO Visit (Trip_ID, Tourist_ID) VALUES 
	('TP1001', 'TS1003'),
	('TP1002', 'TS1005'), 
	('TP1003', 'TS1001'), 
	('TP1004', 'TS1002'), 
	('TP1005', 'TS1004');


--views


--adding venue column on tour as a foreign key for the locations
ALTER TABLE TOUR
	ADD Ven_ID CHAR(6);
ALTER TABLE TOUR
	ADD CONSTRAINT Tour_Ven_ID_fk FOREIGN KEY (Ven_ID) REFERENCES VENUE;

UPDATE TOUR 
SET Ven_ID = 'VN1002' WHERE Tour_ID = 'TR1001';
UPDATE TOUR
SET Ven_ID = 'VN1003' WHERE Tour_ID = 'TR1002';
UPDATE TOUR
SET Ven_ID = 'VN1005' WHERE Tour_ID = 'TR1003';
UPDATE TOUR
SET Ven_ID = 'VN1001' WHERE Tour_ID = 'TR1004';
UPDATE TOUR
SET Ven_ID = 'VN1004' WHERE Tour_ID = 'TR1005';

--VIew to see the details of reservations made in the visit table like who made them, where, and who is givivng them
ALTER VIEW visit_Reservation_User AS
SELECT Tourist_Name, Tourist_Phone, Tour_Name, Trip_Start, Tour_Fee, Guide_Name, Ven_name
FROM TOURIST ts 
JOIN VISIT vs ON ts.Tourist_ID = vs.Tourist_ID				
JOIN TRIP tr ON vs.Trip_ID = tr.Trip_ID
JOIN TOUR tour ON tour.Tour_ID = tr.Tour_ID
JOIN GUIDE g ON tr.Guide_ID = g.Guide_Name
JOIN Venue ven ON ven.Ven_ID = tour.Ven_ID;


--just a little view that displays the tours by lowest price to largest
CREATE VIEW order_Tours_and_Venues AS
SELECT  Tour_Name, Tour_Dur, Tour_Fee, Ven_Name as 'Location visited' FROM TOUR t
JOIN Venue v ON v.Ven_ID = t.Ven_ID;
;




--////////////////////////

--stored procedure
go
CREATE PROCEDURE join_randomTrip(@touristId CHAR(6))
AS
BEGIN
	DECLARE @randomTripID CHAR(6) = (SELECT TOP 1 * FROM Trip ORDER BY NEWID())

	Begin try
		IF EXISTS (SELECT * FROM VISIT WHERE Trip_ID = @randomTripID AND Tourist_ID = @touristId)
		begin
			print 'It seems you have already completed and hopefully enjoyed this tour!'
		end

		ELSE
		begin
			INSERT INTO VISIT VALUES(@touristId, @randomTripID)
			DECLARE @TripInfo VARCHAR(100) = (SELECT TOP 1 Tour_Name --ensures only 1 value is assigned
											FROM TRIP 
											JOIN TOUR ON trip.Tour_ID = tour.Tour_ID
											WHERE Trip_ID = @randomTripID)
			print CONCAT('You have been assigned to ', @TripInfo, ', we hope you enjoy your tour :)');
		end
	End try
	BEGIN CATCH
		THROW
		print'Oops something must have gone wrong please be patient'
	End CATCH
END;




ALTER TABLE TRIP
	DROP COLUMN Trip_Start; 

ALTER TABLE TRIP
	ADD trip_Start DATETIME;

UPDATE TRIP
SET Trip_Start = '2025-05-26 10:30'
WHERE Trip_ID = 'TP1001';
UPDATE TRIP
SET Trip_Start = '2025-10-20 12:00'
WHERE Trip_ID = 'TP1002';
UPDATE TRIP
SET Trip_Start = '2025-08-14 08:45'
WHERE Trip_ID = 'TP1003';
UPDATE TRIP
SET Trip_Start = '2025-04-30 10:00'
WHERE Trip_ID = 'TP1004';
UPDATE TRIP
SET Trip_Start = '2025-12-17 11:15'
WHERE Trip_ID = 'TP1005';

--Stored procedure to cancel a reservation , but with condition that you cancel at least 4 hours before or ot will not allow you to cancel
go
ALTER PROCEDURE cancelReservation(@trip CHAR(6), @touristID CHAR(6))
AS
BEGIN
DECLARE @startTime TIME = (SELECT trip_Start from TRIP where Trip_Id = @trip);
declare @timeDifference INT = DATEDIFF(SECOND,@startTime, (GETDATE())) / 3600; --get hours
BEGIN TRY
IF(@timeDifference >= 4)
	begin 
	DELETE from VISIT WHERE Trip_ID = @trip AND Tourist_ID = @touristID;
	 print 'your reservation was successfully cancelled'
	end
ELSE
	begin 
			print'sorry you cannot cancel this reservation as the limit for cancellation is 4 hours ahead'
	end
END TRY
begin catch
	THROW
	print ' something must have  goe wrong'
end catch
END;
--need to add checking if the reservation exsists

EXec cancelReservation 'TP1001', 'TS1005'
--iteneraire, price venues, hours, guide

SELECT * FROM GUIDE;
SELECT * FROM PLACE;
SELECT * FROM Qualification;
SELECT * FROM Tourist;
SELECT * FROM TourVenue;
SELECT * FROM Trip;
SELECT * FROM Tour;
SELECT * FROM Venue;

SELECT * FROM Visit;
