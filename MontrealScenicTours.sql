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

CREATE TABLE Qualification (
	Qual_ID CHAR(6) CONSTRAINT Qualification_Qual_ID_PK PRIMARY KEY (Qual_ID),
	is_Qualified BIT CHECK (is_Qualified = 0 OR is_Qualified = 1),
	Tour_ID CHAR (6) CONSTRAINT Qualification_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES (Tour),
);

CREATE TABLE Location (
	Loc_ID CHAR (6) CONSTRAINT Location_Loc_ID_FK PRIMARY KEY (Loc_ID),
	Loc_Name VARCHAR(30),
	Loc_Type VARCHAR(12),
	Loc_Desc VARCHAR(45),
	Loc_Idx INT,
	Addr_ID CHAR(6) CONSTRAINT Location_Addr_ID_FK FOREIGN KEY (Addr_ID) REFERENCES (Address)
)

CREATE TABLE Tour (
	Tour_ID CHAR(6) CONSTRAINT Tour_Tour_ID_PK PRIMARY KEY (Tour_ID),
	Tour_Name VARCHAR(20),
	Tour_Dur INT,
	Tour_Fee MONEY,
	Tour_Order VARCHAR(6),
	Guide_ID CHAR(6) CONSTRAINT Tour_Guide_ID_FK FOREIGN KEY (Guide_ID) REFERENCES (Guide),
);

CREATE TABLE Guide (
	Guide_ID CHAR(6) CONSTRAINT Guide_Guide_ID_pk PRIMARY KEY (Guide_ID),
	Guide_Name VARCHAR(30),
	Guide_DOH DATE,
	Qual_ID CHAR(6) CONSTRAINT Guide_Qual_ID_FK FOREIGN KEY (Qual_ID) REFERENCES (Qualification),
	Addr_ID CHAR(6) CONSTRAINT Guide_Addr_ID_FK FOREIGN KEY (Addr_ID) REFERENCES (Address),
	Tour_ID CHAR(6) CONSTRAINT Guide_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES (Tour)
);

CREATE TABLE Trip (
	Trip_ID CHAR(6) CONSTRAINT Trip_Trip_ID_PK PRIMARY KEY (Trip_ID),
	Trip_Name VARCHAR(20),
	Trip_Start TIME,
	Trip_End TIME,
	Tour_ID CHAR(6) CONSTRAINT Trip_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES (Tour),
	Guide_ID CHAR(6) CONSTRAINT Tour_Guide_ID_FK FOREIGN KEY (Guide_ID) REFERENCES (Guide)
)
