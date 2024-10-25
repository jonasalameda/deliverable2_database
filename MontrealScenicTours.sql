CREATE DATABASE MontrealScenicTours
USE MontrealScenicTours

-- code :o

CREATE TABLE Place (
	Place_ID CHAR(6) CONSTRAINT Place_Place_ID_PK PRIMARY KEY (Place_ID),
	Place_Stno INT,
	Place_Stname VARCHAR(64),
	Place_City VARCHAR(64),
	Place_Postal CHAR(7) 
);

CREATE TABLE Guide (
	Guide_ID CHAR(6) CONSTRAINT Guide_Guide_ID_PK PRIMARY KEY (Guide_ID),
	Guide_Name VARCHAR(32),
	Guide_DOH DATE,
	Guide_PHONE VARCHAR(12),
	Guide_EMAIL VARCHAR(50),
	Place_ID CHAR(6) CONSTRAINT Guide_Place_ID_FK FOREIGN KEY (Place_ID) REFERENCES Place(Place_ID)
);

CREATE TABLE Tourist(
	Tourist_ID CHAR(6) CONSTRAINT Tourist_Tourist_ID_PK PRIMARY KEY (Tourist_ID),
	Tourist_Name VARCHAR(32),
	Tourist_Phone VARCHAR(12),
	Tourist_Email VARCHAR(50),
	Place_ID CHAR(6) CONSTRAINT Tourist_Place_ID_FK FOREIGN KEY (Place_ID) REFERENCES Place(Place_ID)
	--The diagram depicts a foreign key for the TRIP_ID, should we add that here?
);

CREATE TABLE Tour (
	Tour_ID CHAR(6) CONSTRAINT Tour_Tour_ID_PK PRIMARY KEY (Tour_ID),
	Tour_Name VARCHAR(32) CONSTRAINT Venue_Ven_Name_UK UNIQUE,
	Tour_Dur INT,
	Tour_Fee MONEY,
	Tour_Order INT IDENTITY (100000, 1),
	--diagram depicts a "TOUR_QUAL_RQD to check if qualifications are required, i can remove this from the diagram.
	--again diagram depicts a foreign key for this table (guide_ID & Venue_ID)
);

CREATE TABLE Qualification (
	Guide_ID CHAR(6) CONSTRAINT Qualification_Guide_ID_FK FOREIGN KEY (Guide_ID) REFERENCES Guide(Guide_ID),
	Tour_ID CHAR (6) CONSTRAINT Qualification_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID),
	Qual_Is_Rqd BIT CHECK (Qual_Is_Rqd = 0 OR Qual_Is_Rqd = 1),
	Qual_Date DATE,
	PRIMARY KEY (Guide_ID, Tour_ID)
);

CREATE TABLE Venue (
	Ven_ID CHAR (6) CONSTRAINT Venue_Loc_ID_PK PRIMARY KEY (Ven_ID),
	Ven_Name VARCHAR(64) CONSTRAINT Venue_Ven_Name_UK UNIQUE,
	Ven_Type VARCHAR(32),
	Ven_Desc VARCHAR(64),
	Ven_Idx INT IDENTITY (100000, 1),
	Addr_ID CHAR(6) CONSTRAINT Venue_Addr_ID_FK FOREIGN KEY (Addr_ID) REFERENCES Place(Place_ID)
);

CREATE TABLE TourVenue (
	Ven_ID CHAR (6) CONSTRAINT TourSite_Ven_ID_FK FOREIGN KEY (Ven_ID) REFERENCES Venue(Ven_ID),
	Tour_ID CHAR(6) CONSTRAINT TourSite_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES Tour(Tour_ID),
	PRIMARY KEY (Ven_ID, Tour_ID)
)

CREATE TABLE Trip (
	Trip_ID CHAR(6) CONSTRAINT Trip_Trip_ID_PK PRIMARY KEY (Trip_ID),
	Trip_Start TIME,
	Trip_End TIME
	--Diagram depicts foreign keys for TOUR_ID & GUIDE_ID
);

CREATE TABLE Visit (
	Trip_ID CHAR(6) CONSTRAINT Trip_Trip_ID_FK FOREIGN KEY (Trip_ID) REFERENCES Trip(Trip_ID),
	Tourist_ID CHAR(6) CONSTRAINT Tourist_Tourist_ID_FK FOREIGN KEY (Tourist_ID) REFERENCES Tourist(Tourist_ID),
	PRIMARY KEY (Trip_ID, Tourist_ID)
)


CREATE SEQUENCE touristID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;

INSERT INTO Tourist VALUES (CONCAT('TS',NEXT VALUE FOR touristID_next), 'Someone', '1234-5678')

CREATE SEQUENCE guideID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;

INSERT INTO Guide VALUES (CONCAT('GD',NEXT VALUE FOR guideID_next), 'Someone', '1234-5678')

CREATE SEQUENCE tripID_next 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;

INSERT INTO Trip VALUES (CONCAT('TP',NEXT VALUE FOR tripID_next), 'Someone', '1234-5678')

CREATE SEQUENCE tourID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;

INSERT INTO Tour VALUES (CONCAT('TR',NEXT VALUE FOR tourID_next), 'Someone', '1234-5678')

CREATE SEQUENCE placeID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;

INSERT INTO Place VALUES (CONCAT('AD',NEXT VALUE FOR placeID_next), 'Someone', '1234-5678')

CREATE SEQUENCE venueID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;

INSERT INTO Venue VALUES (CONCAT('VN',NEXT VALUE FOR venueID_next), 'Someone', '1234-5678')
