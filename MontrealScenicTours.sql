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
	Ven_Name VARCHAR(30) CONSTRAINT Venue_Ven_Name_UK UNIQUE,
	Ven_Type VARCHAR(12),
	Ven_Desc VARCHAR(45),
	Ven_Idx INT IDENTITY (100000, 1),
	Addr_ID CHAR(6) CONSTRAINT Venue_Addr_ID_FK FOREIGN KEY (Addr_ID) REFERENCES (Address)
);

CREATE TABLE Tour (
	Tour_ID CHAR(6) CONSTRAINT Tour_Tour_ID_PK PRIMARY KEY (Tour_ID),
	Tour_Name VARCHAR(20) CONSTRAINT Venue_Ven_Name_UK UNIQUE,
	Tour_Dur INT,
	Tour_Fee MONEY,
	Tour_Order INT IDENTITY (100000, 1),
);

CREATE TABLE TourSite (
	Ven_ID CHAR (6) CONSTRAINT TourSite_Ven_ID_FK FOREIGN KEY (Ven_ID) REFERENCES Venue,
	Tour_ID CHAR(6) CONSTRAINT TourSite_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES Tour,
	PRIMARY KEY (Ven_ID, Tour_ID)
)

CREATE TABLE Trip (
	Trip_ID CHAR(6) CONSTRAINT Trip_Trip_ID_PK PRIMARY KEY (Trip_ID),
	Trip_Name VARCHAR(20) CONSTRAINT Trip_Trip_Name_UK UNIQUE,
	Trip_Start TIME,
	Trip_End TIME,
);

--CHANGE NAME!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
CREATE TABLE Visit (
	Trip_ID CHAR(6) CONSTRAINT Trip_Trip_ID_FK FOREIGN KEY (Trip_ID) REFERENCES (Trip),
	Tourist_ID CHAR(6) CONSTRAINT Tourist_Tourist_ID_FK FOREIGN KEY (Tourist_ID) REFERENCES (Tourist),
	PRIMARY KEY (Trip_ID, Tourist_ID)
)

CREATE TABLE Tourist(
	Tourist_ID CHAR(6) CONSTRAINT Tourist_Tourist_ID_PK PRIMARY KEY (Tourist_ID),
	Tourist_Name VARCHAR(30),
	Tourist_Phone VARCHAR(11),
	Addr_ID CHAR(6) CONSTRAINT Tourist_Addr_ID_FK FOREIGN KEY (Addr_ID) REFERENCES (Address)
);

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


CREATE SEQUENCE transactionID_next 
START WITH 100001
INCREMENT BY 1
MINVALUE 1000
MAXVALUE 2001
NO CYCLE 
NO CACHE;

