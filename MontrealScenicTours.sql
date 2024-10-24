CREATE DATABASE MontrealScenicTours
USE MontrealScenicTours

-- code :o

CREATE TABLE Address (
	Addr_ID CHAR(6) CONSTRAINT Address_Addr_ID_PK PRIMARY KEY (Addr_ID),
	Addr_Stno INT,
	Addr_Stname VARCHAR(30),
	Addr_City VARCHAR(20),
	Addr_Postal CHAR(6) 
);

CREATE TABLE Guide (
	Guide_ID CHAR(6) CONSTRAINT Guide_Guide_ID_PK PRIMARY KEY (Guide_ID),
	Guide_Name VARCHAR(30),
	Guide_DOH DATE,
	Addr_ID CHAR(6) CONSTRAINT Guide_Addr_ID_FK FOREIGN KEY (Addr_ID) REFERENCES (Address)
);

CREATE TABLE Qualification (
	Guide_ID CHAR(6) CONSTRAINT Qualification_Guide_ID_FK FOREIGN KEY (Guide_ID) REFERENCES Guide,
	Tour_ID CHAR (6) CONSTRAINT Qualification_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES (Tour),
	Qual_Is_Rqd BIT CHECK (Qual_Is_Rqd = 0 OR Qual_Is_Rqd = 1),
	Qual_Date DATE,
	PRIMARY KEY (Guide_ID, Tour_ID)
);

CREATE TABLE Venue (
	Ven_ID CHAR (6) CONSTRAINT Venue_Loc_ID_PK PRIMARY KEY (Ven_ID), --just changed the syntax it was written Id_FK
	Ven_Name VARCHAR(30),
	Ven_Type VARCHAR(12),
	Ven_Desc VARCHAR(45),
	Ven_Idx INT,
	Addr_ID CHAR(6) CONSTRAINT Venue_Addr_ID_FK FOREIGN KEY (Addr_ID) REFERENCES (Address)
);

CREATE TABLE Tour (
	Tour_ID CHAR(6) CONSTRAINT Tour_Tour_ID_PK PRIMARY KEY (Tour_ID),
	Tour_Name VARCHAR(20),
	Tour_Dur INT,
	Tour_Fee MONEY,
	Tour_Order VARCHAR(6),
);

CREATE TABLE Trip (
	Trip_ID CHAR(6) CONSTRAINT Trip_Trip_ID_PK PRIMARY KEY (Trip_ID),
	Trip_Name VARCHAR(20),
	Trip_Start TIME,
	Trip_End TIME,
);

--CHANGE NAME!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
CREATE TABLE TripLocation (
	Trip_ID CHAR(6) CONSTRAINT Trip_Trip_ID_FK FOREIGN KEY (Trip_ID) REFERENCES (Trip),
	Loc_ID CHAR(6) CONSTRAINT Location_Loc_ID_FK FOREIGN KEY (Loc_ID) REFERENCES (Location),
	PRIMARY KEY (Trip_ID, Loc_ID)
)

CREATE TABLE Invoice (
	Inv_ID CHAR(6) CONSTRAINT Transaction_Txn_ID_PK PRIMARY KEY (Txn_ID),
	Inv_Dot DATE,
	Inv_Amount MONEY
);

CREATE TABLE Tourist(
	Tourist_ID CHAR(6) CONSTRAINT Tourist_Tourist_ID_PK PRIMARY KEY (Tourist_ID),
	Tourist_Name VARCHAR(30),
	Tourist_Phone VARCHAR(11)
)

CREATE SEQUENCE touristID_next --maybe 
START WITH 1000
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 9999
NO CYCLE 
NO CACHE;
SELECT * FROM Tourist

INSERT INTO Tourist VALUES (CONCAT('TR',NEXT VALUE FOR touristID_next), 'Someone', '1234-5678')

CREATE SEQUENCE guideID_next --maybe
START WITH 100001
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 2001
NO CYCLE 
NO CACHE;

ALTER TABLE transaction 
ALTER transaction_ID INT;

CREATE SEQUENCE transactionID_next 
START WITH 100001
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 2001
NO CYCLE 
NO CACHE;


ALTER TABLE location 
ALTER location_ID INT IDENTITY(100001,1);

ALTER TABLE location
ALTER location_name ADD CONSTRAINT location_name_UK UNIQUE;

ALTER TABLE tour
ALTER tour_name ADD CONSTRAINT tour_name_UK UNIQUE;

ALTER TABLE trip
ALTER trip_name ADD CONSTRAINT trip_name_UK UNIQUE;