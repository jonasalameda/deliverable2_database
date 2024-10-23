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

CREATE TABLE Address (
	Addr_ID CHAR(6) CONSTRAINT Address_Addr_ID_PK PRIMARY KEY (Addr_ID),
	Addr_Stno INT,
	Addr_Stname VARCHAR(30),
	Addr_City VARCHAR(20),
	Addr_Postal CHAR(6) 
)
