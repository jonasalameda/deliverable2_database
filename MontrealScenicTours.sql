CREATE DATABASE MontrealScenicTours
USE MontrealScenicTours

-- code :o

CREATE TABLE Guide (
	Guide_ID CHAR(6) CONSTRAINT Guide_Guide_ID_pk PRIMARY KEY (Guide_ID),
	Guide_Name VARCHAR(30),
	Guide_DOH DATE
)

CREATE TABLE Tour (
	Tour_ID CHAR(6) CONSTRAINT Tour_Tour_ID_PK PRIMARY KEY (Tour_ID),
	Tour_Name VARCHAR(20),
	Tour_Dur INT,
	Tour_Fee MONEY,
	Tour_Order VARCHAR(6)
)

CREATE TABLE Qualification (
	Qual_ID CHAR(6) CONSTRAINT Qualification_Qual_ID_PK PRIMARY KEY (Qual_ID),
	is_Qualified BIT CHECK (is_Qualified = 0 OR is_Qualified = 1),
	Tour_ID CHAR (6) CONSTRAINT Qualification_Tour_ID_FK FOREIGN KEY (Tour_ID) REFERENCES (Tour),
	Guide_ID CHAR (6) CONSTRAINT Qualification_Guide_ID_FK FOREIGN KEY (Guide_ID) REFERENCES (Qualification)
)


CREATE TABLE Address (
	Addr_ID CHAR(6) CONSTRAINT Address_Addr_ID_PK PRIMARY KEY (Addr_ID),
	Addr_Stno INT,
	Addr_Stname VARCHAR(30),
	Addr_City VARCHAR(20),
	Addr_Postal CHAR(6) 
)
