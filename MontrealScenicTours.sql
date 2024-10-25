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
	Tour_Name VARCHAR(32) CONSTRAINT Venue_Ven_Name_UK NOT NULL,
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
	Ven_ID CHAR (6) CONSTRAINT Venue_Loc_ID_PK PRIMARY KEY (Ven_ID),
	Ven_Name VARCHAR(64) CONSTRAINT Venue_Ven_Name_UK NOT NULL,
	Ven_Type VARCHAR(32),
	Ven_Desc VARCHAR(64),
	Ven_Idx INT IDENTITY (100000, 1),
	Place_ID CHAR(6) CONSTRAINT Venue_Place_ID_FK FOREIGN KEY (Place_ID) REFERENCES Place(Place_ID)
);

CREATE TABLE TourVenue (
	Ven_ID CHAR (6) CONSTRAINT TourSite_Ven_ID_FK FOREIGN KEY (Ven_ID) REFERENCES Venue(Ven_ID),
	Tour_ID CHAR(6) CONSTRAINT TourSite_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID),
	PRIMARY KEY (Ven_ID, Tour_ID)
)

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

CREATE SEQUENCE touristID_next --maybe 
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


CREATE SEQUENCE tripID_next 
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


CREATE SEQUENCE placeID_next --maybe 
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

/*Place*/
INSERT INTO Place VALUES (CONCAT('AD',NEXT VALUE FOR placeID_next), 'Someone', '1234-5678')

/*Guides*/
INSERT INTO Guide
VALUES (CONCAT('GD',NEXT VALUE FOR guideID_next), 'Someone', '1234-5678')

/*Tourist*/
INSERT INTO Tourist 
VALUES (CONCAT('TS',NEXT VALUE FOR touristID_next), 'Someone', '1234-5678')


/*Tour*/
INSERT INTO Tour 
VALUES (CONCAT('TR',NEXT VALUE FOR tourID_next), 'Someone', '1234-5678')

/*Qualification*/
INSERT INTO Qualification
VALUES(CONCAT('QU',NEXT VALUE FOR qualID_next), /*--tourID, guideID*/, 1, '01-01-2024')

/*Venue*/
INSERT INTO Venue
VALUES(CONCAT('VN',NEXT VALUE FOR veneuID_next), 

/*TourVenue*/

INSERT INTO Venue VALUES (CONCAT('VN',NEXT VALUE FOR venueID_next), 'Someone', '1234-5678')

/*Trip*/
INSERT INTO Trip 
VALUES (CONCAT('TP',NEXT VALUE FOR tripID_next), 'Someone', '1234-5678')

/*Visit*/


