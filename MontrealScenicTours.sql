CREATE DATABASE MontrealScenicTours
USE MontrealScenicTours

CREATE TABLE Place (
	Place_ID CHAR(6) CONSTRAINT Place_Place_ID_PK PRIMARY KEY (Place_ID),
	Place_Stno INT,
	Place_Stname VARCHAR(64),
	Place_City VARCHAR(64),
	Place_Postal CHAR(7) 
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
	Place_ID CHAR(6) CONSTRAINT Tourist_Place_ID_FK FOREIGN KEY (Place_ID) REFERENCES Place(Place_ID)
);

CREATE TABLE Tour (
	Tour_ID CHAR(6) CONSTRAINT Tour_Tour_ID_PK PRIMARY KEY (Tour_ID),
	Tour_Name VARCHAR(32) CONSTRAINT Tour_Tour_Name_NN NOT NULL,
	Tour_Dur INT,
	Tour_Fee MONEY,
	Tour_Order INT IDENTITY (100000, 1),
);

CREATE TABLE Qualification (
	Guide_ID CHAR(6) CONSTRAINT Qualification_Guide_ID_FK FOREIGN KEY (Guide_ID) REFERENCES Guide(Guide_ID) ON DELETE CASCADE,
	Tour_ID CHAR (6) CONSTRAINT Qualification_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID),
	Qual_Is_Rqd BIT CHECK (Qual_Is_Rqd = 0 OR Qual_Is_Rqd = 1),
	Qual_Date DATE NOT NULL,
	PRIMARY KEY (Guide_ID, Tour_ID)
);

CREATE TABLE Venue (
	Ven_ID CHAR (6) CONSTRAINT Venue_Ven_ID_PK PRIMARY KEY (Ven_ID),
	Ven_Name VARCHAR(64) CONSTRAINT Venue_Ven_Name_UK NOT NULL,
	Ven_Type VARCHAR(32),
	Ven_Desc VARCHAR(64),
	Ven_Idx INT IDENTITY (100000, 1),
	Place_ID CHAR(6) CONSTRAINT Venue_Place_ID_FK FOREIGN KEY (Place_ID) REFERENCES Place(Place_ID)
);

CREATE TABLE TourVenue (
	Ven_ID CHAR (6) CONSTRAINT TourVenue_Ven_ID_FK FOREIGN KEY (Ven_ID) REFERENCES Venue(Ven_ID),
	Tour_ID CHAR(6) CONSTRAINT TourVenue_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID),
	PRIMARY KEY (Ven_ID, Tour_ID)
);

CREATE TABLE Trip (
	Trip_ID CHAR(6) CONSTRAINT Trip_Trip_ID_PK PRIMARY KEY (Trip_ID),
	Trip_Start TIME NOT NULL,
	Trip_End TIME
);

CREATE TABLE Visit (
	Trip_ID CHAR(6) CONSTRAINT Trip_Trip_ID_FK FOREIGN KEY (Trip_ID) REFERENCES Trip(Trip_ID),
	Tourist_ID CHAR(6) CONSTRAINT Tourist_Tourist_ID_FK FOREIGN KEY (Tourist_ID) REFERENCES Tourist(Tourist_ID),
	PRIMARY KEY (Trip_ID, Tourist_ID)
)

ALTER TABLE Tour
ALTER COLUMN Tour_name ADD CONSTRAINT Tour_name_UK UNIQUE;

ALTER TABLE Venue
ALTER COLUMN Ven_Name ADD CONSTRAINT Ven_name_UK UNIQUE;

CREATE SEQUENCE placeID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;


CREATE SEQUENCE guideID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;


CREATE SEQUENCE touristID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;

CREATE SEQUENCE tourID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;

CREATE SEQUENCE qualID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;


CREATE SEQUENCE tripID_next 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;

CREATE SEQUENCE venueID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;

CREATE SEQUENCE tourVenueID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;

CREATE SEQUENCE tripID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;

CREATE SEQUENCE visitID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;



/*Place*/
INSERT INTO Place 
VALUES (CONCAT('AD',NEXT VALUE FOR placeID_next),1234,'Lemieux Avenue', 'Montreal', 'H8N 2B6'),
VALUES (CONCAT('AD',NEXT VALUE FOR placeID_next),5647,'Tardif Street', 'Montreal', 'H7L 3C9'),
VALUES (CONCAT('AD',NEXT VALUE FOR placeID_next),9634,'Kennedy Street', 'Montreal', 'H8R 4R7'),
VALUES (CONCAT('AD',NEXT VALUE FOR placeID_next),8820,'Maisonneuve Boulevard', 'Montreal', 'H2C 2V4'),
VALUES (CONCAT('AD',NEXT VALUE FOR placeID_next),8133,'Original Street', 'Montreal', 'H9N 3B6');


/*Guides*/
INSERT INTO Guide
VALUES (CONCAT('GD',NEXT VALUE FOR guideID_next),'John Smith', '10-09-2006', '514-567-8910', NULL, 'AD1002'), 
VALUES (CONCAT('GD',NEXT VALUE FOR guideID_next),'Jane Austen', '23-02-2009', '514-527-8022', 'janeAusten@gmail.com', 'AD1005'), 
VALUES (CONCAT('GD',NEXT VALUE FOR guideID_next),'Linda Nordstrom', '21-04-2014', '514-522-4858', 'nordstromLinda@gmail.com', 'AD1003'), 
VALUES (CONCAT('GD',NEXT VALUE FOR guideID_next),'Kevin Hart', '30-09-2015', '514-986-3214', 'hartK@gmail.com', 'AD1001'), 
VALUES (CONCAT('GD',NEXT VALUE FOR guideID_next),'Andrea Balazar', '23-11-2015', '514-963-4466', 'andreaB@gmail.com', 'AD1004'); 


/*Tourist*/
INSERT INTO Tourist 
VALUES (CONCAT('TS',NEXT VALUE FOR touristID_next), 'Beyonce Carter', '514-123-5678', 'carterB@gmail.com', 'AD1003'),
VALUES (CONCAT('TS',NEXT VALUE FOR touristID_next), 'Justin Power', '514-447-9664', 'PowerJ@gmail.com', 'AD1001'),
VALUES (CONCAT('TS',NEXT VALUE FOR touristID_next), 'Penelope Garcia', '514-331-6998', 'PenelopeG@gmail.com', 'AD1004'),
VALUES (CONCAT('TS',NEXT VALUE FOR touristID_next), 'Janine Teagues', '514-323-2323', NULL, 'AD1005'),
VALUES (CONCAT('TS',NEXT VALUE FOR touristID_next), 'Minwan Kim', '514-119-8678', 'minwanKim@gmail.com', 'AD1002');

/*Tour*/
INSERT INTO Tour 
VALUES (CONCAT('TR',NEXT VALUE FOR tourID_next), 'Downtown Tour', 80, 34.99),
VALUES (CONCAT('TR',NEXT VALUE FOR tourID_next), 'Plateu Tour', 105, 63.99),
VALUES (CONCAT('TR',NEXT VALUE FOR tourID_next), 'Old Port Tour', 135, 49.99),
VALUES (CONCAT('TR',NEXT VALUE FOR tourID_next), 'WestMount Tour', 75, 54.99),
VALUES (CONCAT('TR',NEXT VALUE FOR tourID_next), 'Acadie Tour', 75, 29.99);


/*Qualification*/
INSERT INTO Qualification
VALUES(CONCAT('QU',NEXT VALUE FOR qualID_next),'TR1003', 'GD1001', 1, '01-01-2015'),
VALUES(CONCAT('QU',NEXT VALUE FOR qualID_next),'TR1005', 'GD1002', 1, '20-11-2016'),
VALUES(CONCAT('QU',NEXT VALUE FOR qualID_next),'TR1004', 'GD1004', 1, '13-09-2014'),
VALUES(CONCAT('QU',NEXT VALUE FOR qualID_next),'TR1001', 'GD1005', 1, '18-08-2019'),
VALUES(CONCAT('QU',NEXT VALUE FOR qualID_next),'TR1002', 'GD1003', 1, '26-03-2012');

/*Venue*/
INSERT INTO Venue
VALUES(CONCAT('VN',NEXT VALUE FOR veneuID_next),'La Roue de Mtl','Touristic Attraction','Montreal wheel is in old port','AD1005'), 
VALUES(CONCAT('VN',NEXT VALUE FOR veneuID_next),'La Roue de Mtl','Touristic Attraction','Montreal wheel is in old port','AD1003'), 
VALUES(CONCAT('VN',NEXT VALUE FOR veneuID_next),'La Roue de Mtl','Touristic Attraction','Montreal wheel is in old port','AD1002'), 
VALUES(CONCAT('VN',NEXT VALUE FOR veneuID_next),'La Roue de Mtl','Touristic Attraction','Montreal wheel is in old port','AD1004'), 
VALUES(CONCAT('VN',NEXT VALUE FOR veneuID_next),'La Roue de Mtl','Touristic Attraction','Montreal wheel is in old port','AD1001'), 


/*TourVenue*/

INSERT INTO TourVenue
VALUES (CONCAT('VN',NEXT VALUE FOR tourVenueID_next), 'Someone', '1234-5678')

/*Trip*/
INSERT INTO Trip 
VALUES (CONCAT('TP',NEXT VALUE FOR tripID_next), 'Someone', '1234-5678')

/*Visit*/
INSERT INTO Visit
VALUES(CONCAT(VS, NEXT VALUE FOR visitID_next), 


